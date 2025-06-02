# Aplikasi To-Do List MVVM Flutter

## Gambaran Umum Pola MVVM

MVVM (Model-View-ViewModel) adalah pola desain perangkat lunak yang memisahkan logika aplikasi menjadi tiga komponen utama:

- **Model**: Mewakili data dan logika bisnis aplikasi. Dalam proyek ini, model `Task` mewakili tugas dengan atribut seperti id, judul, dan status selesai.
- **ViewModel**: Mengelola data dan logika bisnis yang diperlukan oleh View, serta menyediakan data ke View dan memperbarui View saat data berubah. Pada aplikasi ini, `TaskViewModel` mengelola daftar tugas dan operasi CRUD.
- **View**: Bagian antarmuka pengguna yang menampilkan data dan menerima input pengguna. Menggunakan Flutter widget yang mendengarkan perubahan ViewModel melalui `provider`.

Dengan pola ini, aplikasi menjadi lebih terstruktur, mudah dipelihara, dan memisahkan tanggung jawab dengan jelas.

## Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK sudah terinstall di komputer Anda.

2. Clone repositori ini:

   ```bash
   git clone git clone https://github.com/abdairsyaputramirudin/afl2-webdev-todo-abda
   ```

3. Masuk ke folder proyek:

   ```bash
   cd nama_folder_proyek
   ```

4. Install dependencies:

   ```bash
   flutter pub get
   ```

5. Jalankan aplikasi pada emulator atau perangkat:

   ```bash
   flutter run
   ```

6. **Setelah aplikasi berjalan, berikut cara menggunakan aplikasi:**

   - Pada layar utama, kamu akan melihat daftar tugas. Jika belum ada tugas, akan muncul pesan yang menyatakan daftar tugas kosong.
   - Untuk menambahkan tugas baru, tekan tombol **Tambah Tugas** (ikon plus di pojok kanan bawah).
   - Pada halaman tambah tugas, isi **Judul Tugas** pada form yang tersedia. Pastikan tidak kosong karena ada validasi input.
   - Tekan tombol **Simpan Tugas** untuk menambahkan tugas ke daftar.
   - Kembali ke layar daftar tugas, tugas baru akan muncul secara otomatis.
   - Untuk menandai tugas sebagai selesai, centang kotak di sebelah kiri nama tugas. Tugas selesai akan diberi garis coret sebagai penanda.
   - Untuk menghapus tugas, geser tugas ke kiri, kemudian konfirmasi hapus akan muncul. Setelah konfirmasi, tugas akan terhapus dari daftar.

## Refleksi

Pada tugas ini, saya mempelajari dan menerapkan pola desain MVVM (Model-View-ViewModel) dalam pengembangan aplikasi Flutter sederhana berupa daftar tugas. Penerapan pola MVVM ini sangat membantu saya dalam memisahkan kode berdasarkan tanggung jawabnya masing-masing, yaitu Model untuk data dan logika bisnis, ViewModel untuk pengelolaan state dan komunikasi data, serta View sebagai antarmuka pengguna yang responsif. Dengan struktur ini, kode menjadi lebih terorganisir dan mudah dipelihara.

Dalam proses pengerjaan, saya menggunakan package `provider` sebagai solusi manajemen state yang memudahkan sinkronisasi data antar komponen secara efisien. Saya belajar bagaimana `ChangeNotifier` bekerja sebagai pemberi notifikasi perubahan data dan bagaimana widget `Consumer` mendengarkan perubahan tersebut untuk memperbarui UI secara otomatis. Hal ini sangat berguna agar aplikasi selalu menampilkan data yang terbaru tanpa perlu penanganan manual yang rumit.

Salah satu tantangan yang saya hadapi adalah memahami bagaimana menghubungkan ViewModel dengan View dengan benar, sehingga perubahan pada data langsung tercermin di tampilan. Selain itu, saya juga belajar pentingnya validasi input pada form untuk memastikan data yang dimasukkan pengguna valid dan mencegah error pada aplikasi. Saya juga mencoba memperbaiki UI agar lebih user-friendly dengan penambahan fitur seperti konfirmasi penghapusan dan feedback melalui snackbar.

Secara keseluruhan, tugas ini memberi pengalaman berharga tentang arsitektur aplikasi yang baik, pemisahan tanggung jawab kode, dan pengelolaan state di Flutter. Saya menjadi lebih percaya diri dalam membuat aplikasi yang scalable dan maintainable menggunakan pola MVVM.

---
