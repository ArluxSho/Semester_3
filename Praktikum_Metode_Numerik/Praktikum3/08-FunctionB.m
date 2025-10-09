function func (arul)
  fprintf('Halo, nama saya %s\n', arul)
  callname(arul)
endfunction

function callname (arul)
  fprintf('Kata "%s" diawali dengan huruf %c.\n', arul, arul(1))
endfunction
