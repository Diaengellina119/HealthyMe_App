# HealthyMe API - Medicine

REST API sederhana untuk fitur **Medicine** pada aplikasi HealthyMe (Flutter).
Dibuat dengan **PHP 8.2 (native) + SQLite**, tanpa framework dan tanpa layanan siap pakai (Firebase/Supabase).

Data dan fitur mengikuti tampilan `medicine_screen.dart`:
kartu obat (nama, harga, gambar), search bar, filter kategori, dan menu Sort By (Name, Rating, Category, Price).

## Teknologi

- PHP 8.2 dengan ekstensi `pdo_sqlite`
- SQLite (file `database.db`)
- Format respons: JSON

## Struktur Folder

```
healthyme_api/
├── db.php          # koneksi database + fungsi jsonResponse()
├── index.php       # routing dan semua endpoint
├── setup.php       # membuat tabel dan data contoh
├── database.db     # database SQLite (dibuat oleh setup.php)
└── README.md
```

## Cara Menjalankan

1. Pastikan PHP terpasang dan ekstensi SQLite aktif:
   ```
   php -v
   php -m | findstr sqlite
   ```
2. Buat database dan data contoh (sekali saja):
   ```
   php setup.php
   ```
   > Peringatan: menjalankan ulang `setup.php` akan mereset semua data.
3. Jalankan server:
   ```
   php -S localhost:8000 index.php
   ```
4. Buka `http://localhost:8000/medicines` untuk mencoba.

## Struktur Tabel `medicines`

| Kolom | Tipe | Keterangan |
|---|---|---|
| id | INTEGER (PK, auto increment) | ID obat |
| name | TEXT, wajib | Nama obat |
| price | INTEGER, wajib | Harga dalam rupiah (contoh `10000`) |
| image | TEXT | Path atau URL gambar |
| category | TEXT, wajib | Respiratory / Heart / Skin / Children |
| type | TEXT, wajib | Medicine / Supplement / Salep |
| rating | REAL | 0 sampai 5 |
| description | TEXT | Deskripsi obat |

## Daftar Endpoint

Base URL: `http://localhost:8000`

| Method | Endpoint | Fungsi |
|---|---|---|
| GET | `/` | Cek API berjalan |
| GET | `/medicines` | Daftar obat (mendukung search, filter, sort) |
| GET | `/medicines/{id}` | Detail satu obat |
| POST | `/medicines` | Tambah obat |
| PUT | `/medicines/{id}` | Ubah obat |
| DELETE | `/medicines/{id}` | Hapus obat |

---

### 1. GET `/medicines`

Query parameter (semuanya opsional, boleh digabung):

| Parameter | Contoh | Keterangan |
|---|---|---|
| search | `?search=para` | Cari berdasarkan nama (mengandung kata) |
| category | `?category=Respiratory` | Filter kategori |
| type | `?type=Salep` | Filter tipe |
| sort | `?sort=price` | Urutkan berdasarkan `name`, `rating`, `category`, atau `price` |
| order | `?order=desc` | `asc` (default) atau `desc` |

Contoh request:

```
GET /medicines?category=Respiratory&sort=price&order=desc
```

Contoh respons (200 OK):

```json
{
  "success": true,
  "count": 2,
  "data": [
    {
      "id": 2,
      "name": "Inhaler Ventolin",
      "price": 45000,
      "image": "assets/images/medicine/medicine_placeholder.png",
      "category": "Respiratory",
      "type": "Medicine",
      "rating": 4.8,
      "description": "Membantu meredakan sesak napas."
    },
    {
      "id": 1,
      "name": "Paracetamol 500mg",
      "price": 10000,
      "image": "assets/images/medicine/medicine_placeholder.png",
      "category": "Respiratory",
      "type": "Medicine",
      "rating": 4.5,
      "description": "Pereda demam dan nyeri ringan."
    }
  ]
}
```

### 2. GET `/medicines/{id}`

Contoh: `GET /medicines/1`

Respons sukses (200 OK):

```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Paracetamol 500mg",
    "price": 10000,
    "image": "assets/images/medicine/medicine_placeholder.png",
    "category": "Respiratory",
    "type": "Medicine",
    "rating": 4.5,
    "description": "Pereda demam dan nyeri ringan."
  }
}
```

Respons jika tidak ada (404 Not Found):

```json
{
  "success": false,
  "message": "Obat tidak ditemukan"
}
```

### 3. POST `/medicines`

Header: `Content-Type: application/json`

Body:

```json
{
  "name": "Amoxicillin 500mg",
  "price": 25000,
  "category": "Respiratory",
  "type": "Medicine",
  "rating": 4.4,
  "description": "Antibiotik untuk infeksi bakteri."
}
```

Field wajib: `name`, `price`, `category`, `type`.
Field opsional: `image` (default gambar placeholder), `rating` (default 0), `description`.

Respons sukses (201 Created):

```json
{
  "success": true,
  "message": "Obat berhasil ditambahkan",
  "data": {
    "id": 6,
    "name": "Amoxicillin 500mg",
    "price": 25000,
    "image": "assets/images/medicine/medicine_placeholder.png",
    "category": "Respiratory",
    "type": "Medicine",
    "rating": 4.4,
    "description": "Antibiotik untuk infeksi bakteri."
  }
}
```

Respons jika data tidak valid (422 Unprocessable Entity):

```json
{
  "success": false,
  "message": "Data tidak valid",
  "errors": ["name wajib diisi"]
}
```

### 4. PUT `/medicines/{id}`

Body sama seperti POST (semua field wajib dikirim ulang).

Contoh: `PUT /medicines/6`

```json
{
  "name": "Amoxicillin 500mg",
  "price": 30000,
  "category": "Respiratory",
  "type": "Medicine",
  "rating": 4.4,
  "description": "Antibiotik untuk infeksi bakteri."
}
```

Respons sukses (200 OK):

```json
{
  "success": true,
  "message": "Obat berhasil diubah",
  "data": { "id": 6, "name": "Amoxicillin 500mg", "price": 30000, "...": "..." }
}
```

Kemungkinan error: 404 (ID tidak ada), 422 (data tidak valid).

### 5. DELETE `/medicines/{id}`

Contoh: `DELETE /medicines/6`

Respons sukses (200 OK):

```json
{
  "success": true,
  "message": "Obat berhasil dihapus"
}
```

Jika ID tidak ada: 404 Not Found.

## Kode Status HTTP

| Kode | Arti |
|---|---|
| 200 | Berhasil |
| 201 | Data berhasil dibuat |
| 404 | Data atau endpoint tidak ditemukan |
| 405 | Method tidak didukung |
| 422 | Data yang dikirim tidak valid |

## Catatan Keamanan

- Semua query database memakai **prepared statement** (PDO) untuk mencegah SQL injection.
- Kolom `sort` dibatasi dengan whitelist (`name`, `rating`, `category`, `price`).
- Input dasar divalidasi sebelum disimpan.

## Pengujian

Seluruh endpoint diuji menggunakan Thunder Client (VS Code), termasuk kasus gagal (404 dan 422).

## Cara Menguji dengan Thunder Client

Pastikan server berjalan (`php -S localhost:8000 index.php`), lalu di VS Code buka Thunder Client → **New Request**. Atur **method**, **URL**, dan **Body** (khusus POST dan PUT), lalu klik **Send**.

| Method | URL | Body | Hasil |
|---|---|---|---|
| GET | `http://localhost:8000/medicines` | - | 200, daftar obat |
| GET | `http://localhost:8000/medicines/1` | - | 200, detail obat |
| GET | `http://localhost:8000/medicines?search=para&category=Respiratory&sort=price&order=asc` | - | 200, hasil search, filter, dan sort |
| POST | `http://localhost:8000/medicines` | JSON (lihat bawah) | 201, obat baru dibuat |
| PUT | `http://localhost:8000/medicines/6` | JSON (lihat bawah) | 200, obat diubah |
| DELETE | `http://localhost:8000/medicines/6` | - | 200, obat dihapus |

**Body untuk POST dan PUT** (tab **Body** → **JSON**):

```json
{
  "name": "Amoxicillin 500mg",
  "price": 25000,
  "category": "Respiratory",
  "type": "Medicine",
  "rating": 4.4,
  "description": "Antibiotik untuk infeksi bakteri."
}
```

**Catatan:**
- Ganti angka `6` pada PUT dan DELETE dengan `id` dari respons POST.
- PUT mewajibkan semua field wajib (`name`, `price`, `category`, `type`) dikirim ulang.

**Contoh kasus gagal:**

| Tes | Hasil |
|---|---|
| GET `/medicines/999` | 404 |
| POST tanpa `name` | 422 |
| PUT ke `/medicines` (tanpa id) | 405 |