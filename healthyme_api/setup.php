<?php
// Script ini dijalankan sekali untuk membuat database dan data contoh.

$pdo = new PDO('sqlite:' . __DIR__ . '/database.db');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$pdo->exec("DROP TABLE IF EXISTS medicines");

$pdo->exec("
    CREATE TABLE medicines (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price INTEGER NOT NULL,
        image TEXT,
        category TEXT NOT NULL,
        type TEXT NOT NULL,
        rating REAL DEFAULT 0,
        description TEXT
    )
");

$data = [
    ['Paracetamol 500mg', 10000, 'assets/images/medicine/medicine_placeholder.png', 'Respiratory', 'Medicine', 4.5, 'Pereda demam dan nyeri ringan.'],
    ['Inhaler Ventolin', 45000, 'assets/images/medicine/medicine_placeholder.png', 'Respiratory', 'Medicine', 4.8, 'Membantu meredakan sesak napas.'],
    ['Vitamin C 1000mg', 35000, 'assets/images/medicine/medicine_placeholder.png', 'Children', 'Supplement', 4.2, 'Suplemen daya tahan tubuh.'],
    ['Salep Hydrocortisone', 22000, 'assets/images/medicine/medicine_placeholder.png', 'Skin', 'Salep', 4.0, 'Meredakan gatal dan ruam kulit.'],
    ['Aspirin 100mg', 15000, 'assets/images/medicine/medicine_placeholder.png', 'Heart', 'Medicine', 4.3, 'Membantu mencegah pembekuan darah.'],
];

$stmt = $pdo->prepare("
    INSERT INTO medicines (name, price, image, category, type, rating, description)
    VALUES (?, ?, ?, ?, ?, ?, ?)
");

foreach ($data as $row) {
    $stmt->execute($row);
}

echo "Database berhasil dibuat. Jumlah data: " . count($data) . "\n";