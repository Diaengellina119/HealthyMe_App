## 🚀 Panduan Kolaborasi Tim 

Halo tim! Biar kode kita tidak saling bentrok dan project berjalan lancar, tolong ikuti *workflow* di bawah ini setiap kali mau mulai koding ya. Kita menggunakan **GitHub Desktop** dan **VS Code**.

### 1. Persiapan Awal (Cukup Sekali)
* Pastikan kalian sudah konfirmasi *invite* kolaborator di email masing-masing.
* Buka **GitHub Desktop** -> klik `File` -> `Clone Repository...`.
* Pilih repository project kita ini, tentukan lokasi folder di laptop kalian, lalu klik **Clone**.

### 2. JANGAN KODING DI BRANCH MAIN!
Setiap kali mau mengerjakan tugas baru (misalnya bikin UI Dashboard), **wajib** membuat *branch* (cabang) baru.
1. Buka GitHub Desktop, pastikan bagian *Current Branch* berada di `main`.
2. Klik tombol **Fetch origin** di bagian atas untuk menarik *update* kode terbaru dari rekan tim lain.
3. Klik menu **Current Branch** -> pilih **New Branch**.
4. Beri nama branch sesuai tugasmu (contoh: `ui-dashboard` atau `api-login`), lalu klik **Create Branch**.
5. Klik **Publish branch** di bagian atas.

### 3. Proses Koding
* Di GitHub Desktop, klik tombol **Open in Visual Studio Code**.
* Kerjakan tugasmu di VS Code. Pastikan selalu tekan **Ctrl + S** (Save) setiap kali melakukan perubahan pada file.

### 4. Cara Upload Kode (Commit & Push)
Kalau tugasmu sudah beres atau kamu mau menyudahi pekerjaan hari ini, simpan progresmu ke GitHub:
1. Buka kembali **GitHub Desktop**. Di panel sebelah kiri (*Changes*), kamu akan melihat daftar file yang baru saja diedit.
2. Di pojok kiri bawah pada kolom **Summary**, tulis deskripsi singkat tentang apa yang baru saja kamu ubah (Contoh: *"Membuat halaman profil"* atau *"Fix bug tombol error"*).
3. Klik tombol biru **Commit to [nama-branch-kamu]**.
4. Klik tombol **Push origin** di atas untuk mengunggah kodenya ke server GitHub.

### 5. Menggabungkan Kode ke Aplikasi Utama (Pull Request)
Kalau fitur yang kamu kerjakan sudah 100% selesai dan siap digabung ke branch `main`:
1. Setelah *Push*, akan muncul tombol **Create Pull Request** di GitHub Desktop. Klik tombol tersebut.
2. Browser akan terbuka otomatis ke web GitHub. Klik tombol hijau **Create pull request**.
3. Kabari aku di grup agar kodenya bisa aku *review* dan *merge* ke `main`.
4. Jika sudah di-*merge*, kembali ke Langkah 2 untuk mengambil tugas baru.

> **💡 Reminder Penting:**
> Biasakan untuk selalu membuka GitHub Desktop dan klik **Fetch origin** sebelum mulai koding setiap harinya, supaya folder di laptopmu tidak tertinggal dari progres tim!