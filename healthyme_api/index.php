<?php
require __DIR__ . '/db.php';

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

$method = $_SERVER['REQUEST_METHOD'];
$path   = trim(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH), '/');
$parts  = $path === '' ? [] : explode('/', $path);

function getBody(): array {
    $body = json_decode(file_get_contents('php://input'), true);
    return is_array($body) ? $body : [];
}

function validateMedicine(array $b): array {
    $errors = [];
    if (empty($b['name']))     $errors[] = 'name wajib diisi';
    if (!isset($b['price']) || !is_numeric($b['price']) || $b['price'] < 0)
        $errors[] = 'price wajib berupa angka >= 0';
    if (empty($b['category'])) $errors[] = 'category wajib diisi';
    if (empty($b['type']))     $errors[] = 'type wajib diisi';
    if (isset($b['rating']) && ($b['rating'] < 0 || $b['rating'] > 5))
        $errors[] = 'rating harus antara 0 sampai 5';
    return $errors;
}

if ($path === '') {
    jsonResponse([
        'success'   => true,
        'message'   => 'HealthyMe API berjalan',
        'endpoints' => [
            'GET /medicines?search=&category=&type=&sort=&order=',
            'GET /medicines/{id}',
            'POST /medicines',
            'PUT /medicines/{id}',
            'DELETE /medicines/{id}',
        ],
    ]);
}

if (($parts[0] ?? '') === 'medicines') {
    $id  = $parts[1] ?? null;
    $pdo = getDB();

    if ($method === 'GET' && $id === null) {
        $sql    = "SELECT * FROM medicines WHERE 1=1";
        $params = [];

        if (!empty($_GET['search'])) {
            $sql .= " AND name LIKE ?";
            $params[] = '%' . $_GET['search'] . '%';
        }
        if (!empty($_GET['category'])) {
            $sql .= " AND category = ?";
            $params[] = $_GET['category'];
        }
        if (!empty($_GET['type'])) {
            $sql .= " AND type = ?";
            $params[] = $_GET['type'];
        }

        $allowedSort = ['name', 'rating', 'category', 'price'];
        $sort  = $_GET['sort'] ?? 'id';
        $sort  = in_array($sort, $allowedSort, true) ? $sort : 'id';
        $order = strtolower($_GET['order'] ?? 'asc') === 'desc' ? 'DESC' : 'ASC';
        $sql  .= " ORDER BY $sort $order";

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        $medicines = $stmt->fetchAll();

        jsonResponse([
            'success' => true,
            'count'   => count($medicines),
            'data'    => $medicines,
        ]);
    }

    if ($method === 'GET' && $id !== null) {
        $stmt = $pdo->prepare("SELECT * FROM medicines WHERE id = ?");
        $stmt->execute([$id]);
        $medicine = $stmt->fetch();

        if (!$medicine) {
            jsonResponse(['success' => false, 'message' => 'Obat tidak ditemukan'], 404);
        }
        jsonResponse(['success' => true, 'data' => $medicine]);
    }

    if ($method === 'POST' && $id === null) {
        $b = getBody();
        $errors = validateMedicine($b);
        if ($errors) {
            jsonResponse(['success' => false, 'message' => 'Data tidak valid', 'errors' => $errors], 422);
        }

        $stmt = $pdo->prepare("
            INSERT INTO medicines (name, price, image, category, type, rating, description)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([
            $b['name'],
            (int) $b['price'],
            $b['image'] ?? 'assets/images/medicine/medicine_placeholder.png',
            $b['category'],
            $b['type'],
            $b['rating'] ?? 0,
            $b['description'] ?? null,
        ]);

        $newId = $pdo->lastInsertId();
        $stmt = $pdo->prepare("SELECT * FROM medicines WHERE id = ?");
        $stmt->execute([$newId]);
        jsonResponse(['success' => true, 'message' => 'Obat berhasil ditambahkan', 'data' => $stmt->fetch()], 201);
    }

    // ---------- PUT /medicines/{id} ----------
    if ($method === 'PUT' && $id !== null) {
        $stmt = $pdo->prepare("SELECT * FROM medicines WHERE id = ?");
        $stmt->execute([$id]);
        if (!$stmt->fetch()) {
            jsonResponse(['success' => false, 'message' => 'Obat tidak ditemukan'], 404);
        }

        $b = getBody();
        $errors = validateMedicine($b);
        if ($errors) {
            jsonResponse(['success' => false, 'message' => 'Data tidak valid', 'errors' => $errors], 422);
        }

        $stmt = $pdo->prepare("
            UPDATE medicines
            SET name = ?, price = ?, image = ?, category = ?, type = ?, rating = ?, description = ?
            WHERE id = ?
        ");
        $stmt->execute([
            $b['name'],
            (int) $b['price'],
            $b['image'] ?? 'assets/images/medicine/medicine_placeholder.png',
            $b['category'],
            $b['type'],
            $b['rating'] ?? 0,
            $b['description'] ?? null,
            $id,
        ]);

        $stmt = $pdo->prepare("SELECT * FROM medicines WHERE id = ?");
        $stmt->execute([$id]);
        jsonResponse(['success' => true, 'message' => 'Obat berhasil diubah', 'data' => $stmt->fetch()]);
    }

    if ($method === 'DELETE' && $id !== null) {
        $stmt = $pdo->prepare("DELETE FROM medicines WHERE id = ?");
        $stmt->execute([$id]);

        if ($stmt->rowCount() === 0) {
            jsonResponse(['success' => false, 'message' => 'Obat tidak ditemukan'], 404);
        }
        jsonResponse(['success' => true, 'message' => 'Obat berhasil dihapus']);
    }

    jsonResponse(['success' => false, 'message' => 'Method tidak didukung'], 405);
}

jsonResponse(['success' => false, 'message' => 'Endpoint tidak ditemukan'], 404);