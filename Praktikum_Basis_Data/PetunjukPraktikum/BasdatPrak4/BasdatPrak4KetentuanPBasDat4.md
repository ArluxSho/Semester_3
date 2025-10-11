Berdasarkan database perpustakaan yang sudah kalian buat di pertemuan sebelumnya. Buatlah query berikut dengan mengimplementasikan TCL:

Soal 1 Ani Wijaya (anggota_id = 2) ingin meminjam buku Clean Code (buku_id = 4).
Sistem harus:
•⁠  ⁠Mengecek apakah Ani terdaftar sebagai anggota.
•⁠  ⁠Mengecek apakah stok buku masih tersedia (jumlah_tersedia > 0).
•⁠  ⁠Jika valid, insert data ke tabel peminjaman dan kurangi stok buku di tabel buku.
•⁠  ⁠Jika salah satu proses gagal (anggota tidak ada, stok 0, atau error lainnya), rollback seluruh transaksi.
TCL: BEGIN TRANSACTION, COMMIT, ROLLBACK, TRY...CATCH.

Soal 2
Petugas perpustakaan ingin menghapus data peminjaman dengan peminjaman_id = 2 karena ada kesalahan input.
Sistem harus:
•⁠  ⁠Mengecek apakah data dengan peminjaman_id tersebut ada.
•⁠  ⁠Jika ada, hapus data peminjaman dan kembalikan stok buku ke tabel buku (jumlah_tersedia + 1).
•⁠  ⁠Jika data tidak ditemukan atau error, rollback perubahan.
TCL: BEGIN TRANSACTION, COMMIT, ROLLBACK, TRY...CATCH.

Soal 3Petugas perpustakaan sedang menginput data peminjaman untuk Siti Nurhaliza (anggota_id = 4) yang ingin meminjam dua buku sekaligus
•⁠  ⁠Laskar Pelangi (buku_id = 1)
•⁠  ⁠Sejarah Peradaban Dunia (buku_id = 5)
Sistem harus:
•⁠  ⁠Mengecek apakah Siti terdaftar sebagai anggota.
•⁠  ⁠Mengecek stok masing-masing buku.
•⁠  ⁠Lakukan insert peminjaman pertama untuk Laskar Pelangi → lalu buat SAVEPOINT.
•⁠  ⁠Jika peminjaman kedua untuk Sejarah Peradaban Dunia gagal (stok habis/error), rollback hanya sampai SAVEPOINT sehingga peminjaman pertama tetap tersimpan.
•⁠  ⁠Jika semua berhasil, commit transaksi.
TCL: BEGIN TRANSACTION, SAVEPOINT, COMMIT, ROLLBACK, TRY...CATCH.

Format nama: 
C_BasisData_03_NIM_Nama.sql
