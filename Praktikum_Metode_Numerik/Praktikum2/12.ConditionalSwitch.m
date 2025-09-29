uang = input('Masukkan jumlah uang dalam Rupiah: ');

if (uang <= 0)
    fprintf('Jumlah uang tidak valid\n');
else
    fprintf('Pilih konversi mata uang:\n');
    fprintf('1. Dollar AS\n');
    fprintf('2. Euro\n');
    fprintf('3. Yen Jepang\n');
    pilihan = input('Masukkan pilihan: ');
    
    switch(pilihan)
        case 1
            hasil = uang / 15000; % asumsi kurs 1 USD = 15000 IDR
            fprintf('Hasil konversi ke Dollar: %.2f USD\n', hasil);
        case 2
            hasil = uang / 16500; % asumsi kurs 1 EUR = 16500 IDR
            fprintf('Hasil konversi ke Euro: %.2f EUR\n', hasil);
        case 3
            hasil = uang / 110; % asumsi kurs 1 JPY = 110 IDR
            fprintf('Hasil konversi ke Yen: %.2f JPY\n', hasil);
        otherwise
            fprintf('Pilihan tidak tersedia\n');
    end
end
