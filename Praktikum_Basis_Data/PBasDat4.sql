USE C_BasisData_02_L0124085_AisyahNurulSholikhah ; 
GO

SELECT * FROM Buku;
SELECT * FROM Peminjaman;

-- SOAL 1
BEGIN TRY
    BEGIN TRANSACTION;

    -- Cek keanggotaan Ani
    IF NOT EXISTS (SELECT 1 FROM Anggota WHERE anggota_id = 2)
    BEGIN

    PRINT 'Gagal: Anggota tidak ditemukan.';
    ROLLBACK;
    RETURN;

    END

    -- Cek stok buku Clean Code
    IF NOT EXISTS (SELECT 1 FROM Buku WHERE buku_id = 4)
    BEGIN

    PRINT 'Gagal: Buku tidak ditemukan.';
    ROLLBACK;
    RETURN;

    END

    IF (SELECT jumlah_tersedia FROM Buku WHERE buku_id = 4) <= 0
    BEGIN

    PRINT 'Gagal: Stok buku habis.';
    ROLLBACK;
    RETURN;

    END

    -- Insert ke tabel peminjaman jika valid
    INSERT INTO Peminjaman (anggota_id, buku_id, petugas_id, tanggal_peminjaman, tanggal_pengembalian, [status])
    VALUES (2, 4, 2, GETDATE (), DATEADD (DAY, 14, GETDATE ()), 'Dipinjam');

    -- kurangi stok buku
    UPDATE Buku
    SET jumlah_tersedia = jumlah_tersedia - 1
    WHERE buku_id = 4;

    COMMIT TRANSACTION;
    PRINT 'Transaksi berhasil: Buku berhasil dipinjam.';
END TRY

BEGIN CATCH
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;

    PRINT 'Terjadi kesalahan: ' + ERROR_MESSAGE ();
END CATCH;



-- SOAL 2
BEGIN TRY
    BEGIN TRANSACTION;

    -- cek data peminjam id 2
    IF NOT EXISTS (SELECT 1 FROM Peminjaman WHERE peminjaman_id = 2)
    BEGIN

    PRINT 'Gagal: Data peminjaman tidak ditemukan.';
    ROLLBACK TRANSACTION;
    RETURN;

    END

    -- stok buku di ke,balikan
    UPDATE Buku
    SET jumlah_tersedia = jumlah_tersedia + 1
    WHERE buku_id = (SELECT buku_id FROM Peminjaman WHERE peminjaman_id = 2);

    -- data peminjaman dihapus
    DELETE FROM Peminjaman WHERE peminjaman_id = 2;

    COMMIT TRANSACTION;
    PRINT 'Transaksi berhasil: Data peminjaman dihapus dan stok buku dikembalikan.';
END TRY

BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Terjadi kesalahan: ' + ERROR_MESSAGE ();
END CATCH;



-- SOAL 3
BEGIN TRY
    BEGIN TRANSACTION;

    -- cek keanggotaan Siti
    IF NOT EXISTS (SELECT 1 FROM Anggota WHERE anggota_id = 4)
    BEGIN

    PRINT 'Gagal: Anggota tidak ditemukan.';
    ROLLBACK TRANSACTION;
    RETURN;
    
    END;

    -- cek stok buku laskar pelangi
    IF (SELECT jumlah_tersedia FROM Buku WHERE buku_id = 1) <= 0
    BEGIN

    PRINT 'Gagal: Stok buku Laskar Pelangi habis.';
    ROLLBACK TRANSACTION;
    RETURN;
    
    END;

    -- insert peminjaman buku
    INSERT INTO Peminjaman (anggota_id, buku_id, petugas_id, tanggal_peminjaman, tanggal_pengembalian, [status])
    VALUES (4, 1, 2, GETDATE (), DATEADD (DAY, 14, GETDATE ()), 'Dipinjam');

    -- kurangi stok buku
    UPDATE Buku
    SET jumlah_tersedia = jumlah_tersedia - 1
    WHERE buku_id = 1;

    PRINT 'Peminjaman pertama (Laskar Pelangi) berhasil.';


    -- savepoint
    SAVE TRANSACTION PeminjamanPertama;

    -- cek dtok buku sejarah peradaban dunia
    IF (SELECT jumlah_tersedia FROM Buku WHERE buku_id = 5) <= 0
    BEGIN

    PRINT 'Gagal: Stok buku Sejarah Peradaban Dunia habis.';
    ROLLBACK TRANSACTION PeminjamanPertama;  -- rollback hanya setelah savepoint
    COMMIT TRANSACTION;  -- tetap simpan peminjaman pertama
    
    RETURN;
    END;

    -- insert peminjam kedua jika tersedia
    INSERT INTO Peminjaman (anggota_id, buku_id, petugas_id, tanggal_peminjaman, tanggal_pengembalian, [status])
    VALUES (4, 5, 2, GETDATE (), DATEADD (DAY, 14, GETDATE ()), 'Dipinjam');

    -- krangi stok buku kedua
    UPDATE Buku
    SET jumlah_tersedia = jumlah_tersedia - 1
    WHERE buku_id = 5;

    -- Jika semua berhasil
    COMMIT TRANSACTION;
    PRINT 'Kedua peminjaman berhasil disimpan.';
END TRY

BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Terjadi kesalahan: ' + ERROR_MESSAGE ();
END CATCH;


SELECT * FROM Buku;
SELECT * FROM Peminjaman;
