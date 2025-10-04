CREATE DATABASE Arul_Data;

USE Arul_Data
GO

-- Tabel Mahasiswa
CREATE TABLE Mahasiswa (
    NIM CHAR(10) PRIMARY KEY,
    NamaMahasiswa VARCHAR(100) NOT NULL,
    Prodi VARCHAR(50) NOT NULL
);

-- Tabel Dosen
CREATE TABLE Dosen (
    NIP CHAR(10) PRIMARY KEY,
    NamaDosen VARCHAR(100) NOT NULL,
    BidangKeahlian VARCHAR(100) NOT NULL
);

-- Tabel MataKuliah
CREATE TABLE MataKuliah (
    KodeMK CHAR(8) PRIMARY KEY,
    NamaMK VARCHAR(100) NOT NULL,
    SKS INT NOT NULL
);

-- Tabel KRS (Relasi Mahasiswa-MataKuliah)
CREATE TABLE KRS (
    IDKRS INT PRIMARY KEY IDENTITY(1,1),
    NIM CHAR(10) NOT NULL,
    KodeMK CHAR(8) NOT NULL,
    SemesterAmbil INT,
    Nilai CHAR(2),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (KodeMK) REFERENCES MataKuliah(KodeMK)
);

-- Tabel Mengajar (Relasi Dosen-MataKuliah)
CREATE TABLE Mengajar (
    IDMengajar INT PRIMARY KEY IDENTITY(1,1),
    NIP CHAR(10) NOT NULL,
    KodeMK CHAR(8) NOT NULL,
    FOREIGN KEY (NIP) REFERENCES Dosen(NIP),
    FOREIGN KEY (KodeMK) REFERENCES MataKuliah(KodeMK)
);

SELECT * FROM Mahasiswa
SELECT * FROM Dosen
SELECT * FROM MataKuliah
SELECT * FROM KRS
SELECT * FROM Mengajar
