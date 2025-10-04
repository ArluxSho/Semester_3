CREATE DATABASE C_BasisData_02_L0124085_AisyahNurulSholikhah ;

-- create tabel dan sudah di run semua
DROP TABLE IF EXISTS anggota ;
CREATE TABLE anggota (
	anggota_id INT PRIMARY KEY IDENTITY (1,1) ,
	nama CHAR (22) NOT NULL ,
	alamat VARCHAR (50) NOT NULL ,
	nomor_telepon VARCHAR (20) NOT NULL ,
	email VARCHAR (20) NOT NULL ,
	tanggal_bergabung DATE NOT NULL ,
	tanggal_lahir DATE NOT NULL
) ;
GO

DROP TABLE IF EXISTS kategori ;
CREATE TABLE kategori (
	kategori_id INT PRIMARY KEY IDENTITY (1,1) ,
	nama_kategori CHAR (45) NOT NULL ,
	deskripsi CHAR (100) NOT NULL
) ;
GO


DROP TABLE IF EXISTS petugas ;
CREATE TABLE petugas (
	petugas_id INT PRIMARY KEY IDENTITY (1,1) ,
	nama CHAR (33) NOT NULL ,
	position CHAR (22) NOT NULL ,
	nomor_telepon VARCHAR (20) NOT NULL ,
	email VARCHAR (50) NOT NULL ,
	tanggal_lahir DATE NOT NULL
) ;
GO

DROP TABLE IF EXISTS buku;
CREATE TABLE buku (
	buku_id INT PRIMARY KEY IDENTITY (1,1) ,
	kategori_id INT NOT NULL ,
	nama_buku CHAR (25) NOT NULL ,
	judul CHAR (35) NOT NULL ,
	penulis CHAR (25) NOT NULL ,
	penerbit CHAR (33) NOT NULL ,
	sinopsis CHAR (111) NOT NULL ,
	tahun_penerbitan INT NOT NULL ,
	ISBN VARCHAR (20) NOT NULL ,
	jumlah_tersedia INT,
	CONSTRAINT FK_idkategori_kategori FOREIGN KEY (kategori_id)
		REFERENCES kategori (kategori_id)
) ;
GO

DROP TABLE IF EXISTS peminjaman ;
CREATE TABLE peminjaman (
	peminjaman_id INT PRIMARY KEY IDENTITY (1,1) ,
	anggota_id INT NOT NULL ,
	buku_id INT NOT NULL ,
	petugas_id INT NOT NULL ,
	tanggal_peminjaman DATE NOT NULL ,
	tanggal_pengembalian DATE NOT NULL ,
	[status] CHAR (22) NOT NULL ,
	CONSTRAINT FK_anggotaid_anggota FOREIGN KEY (anggota_id)
		REFERENCES anggota (anggota_id) ,
	CONSTRAINT FK_bukuid_buku FOREIGN KEY (buku_id)
		REFERENCES buku (buku_id) ,
	CONSTRAINT FK_petugasid_petugas FOREIGN KEY (petugas_id)
		REFERENCES petugas (petugas_id)
) ;
GO

-- memberikan nilai ke tabel dan udah semua
INSERT INTO anggota (nama, alamat, nomor_telepon, email, tanggal_bergabung, tanggal_lahir) 
VALUES
('Budi Santoso','Jl. Merdeka No. 10, Jakarta','81234567890','budi@example.com','2023-01-15','1985-04-20') ,
('Ani Wijaya','Jl. Sudirman No. 45, Bandung','82345678901','ani@example.com','2022-11-22','1990-02-11') ,
('Agus Pratama','Jl. Diponegoro No. 5, Surabaya','83456789012','agus@example.com','2021-07-30','1988-09-15') ,
('Siti Nurhaliza','Jl. Gatot Subroto No. 7, Medan','84567890123','siti@example.com','2020-03-18','1995-12-05') ,
('Dedi Kurniawan','Jl. Ahmad Yani No. 20, Yogyakarta','85678901234','dedi@example.com','2019-08-25','1992-06-21') ;
SELECT * FROM anggota

INSERT INTO kategori (nama_kategori, deskripsi) 
VALUES 
('Fiksi','Buku-buku cerita rekaan atau novel') ,
('Non-Fiksi','Buku-buku yang berdasarkan fakta') ,
('Sains','Buku-buku ilmu pengetahuan') ,
('Teknologi','Buku-buku mengenai teknologi') ,
('Sejarah','Buku-buku sejarah dan peristiwa') ;
SELECT * FROM kategori

INSERT INTO petugas (nama, position, nomor_telepon, email, tanggal_lahir)
VALUES
('Rina Andriani','Kepala Perpustakaan','81234567890','rina@example.com','1980-03-15') ,
('Toni Saputra','Pustakawan','82345678901','toni@example.com','1985-08-10') ,
('Lina Kartika','Staf Administrasi','83456789012','lina@example.com','1990-12-01') ;
SELECT *  FROM petugas

INSERT INTO buku 
(kategori_id, nama_buku, judul, penulis, penerbit, sinopsis, tahun_penerbitan, ISBN, jumlah_tersedia)
VALUES
(1, 'Laskar Pelangi','Laskar Pelangi','Andrea Hirata', 'Bentang Pustaka','Kisah perjuangan anak-anak Melayu',2005,'978-979-3062-79-4',10) ,
(2, 'Sapiens','Sapiens: Riwayat Singkat','Yuval Noah Harari','Gramedia Pustaka','Sejarah umat manusia dari awal',2014,'978-602-03-1113-9',5) ,
(3, 'Cosmos','Cosmos','Carl Sagan','Random House','Eksplorasi tentang alam semesta',1980,'978-0-394-50294-6',7) ,
(4, 'Clean Code','Clean Code','Robert C. Martin','Prentice Hall','Panduan praktik terbaik dalam coding',2008,'978-0-13-235088-4',3) ,
(5, 'Sejarah Peradaban Dunia','Sejarah Peradaban Dunia','Will Durant','Simon & Schuster','Catatan sejarah dari berbagai peradaban',1954,'978-0-671-52710-1',8) ;
SELECT * FROM buku

INSERT INTO peminjaman 
(anggota_id, buku_id, petugas_id, tanggal_peminjaman, tanggal_pengembalian, [status])
VALUES
(1,1,2,'2024-01-01','2024-01-15','Dipinjam') ,
(2,3,1,'2024-02-10','2024-02-24','Dikembalikan') ,
(3,2,3,'2024-03-05','2024-03-19','Dipinjam') ,
(4,4,2,'2024-04-12','2024-04-26','Dikembalikan') ,
(5,5,1,'2024-05-20','2024-06-03','Dipinjam') ;
SELECT * FROM peminjaman
