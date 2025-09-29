% ProgramParkir.m
lamaParkir = input('Masukkan lama parkir (jam): ');

if(lamaParkir <= 1)
    fprintf('Tarif parkir: Rp 5.000\n');
elseif(lamaParkir <= 3)
    fprintf('Tarif parkir: Rp 10.000\n');
elseif(lamaParkir <= 5)
    fprintf('Tarif parkir: Rp 15.000\n');
elseif(lamaParkir <= 10)
    fprintf('Tarif parkir: Rp 25.000\n');
else
    fprintf('Tarif parkir: Rp 50.000 (flat)\n');
end
