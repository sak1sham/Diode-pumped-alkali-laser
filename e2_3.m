function ret_fun = e2_3(rj, rj1, N, Tj, n1j, n2j, n3j, R)
      l = 0.025;
      tao_d1 = 34.9*(10^(-9));
      tao_d2 = 30.5*(10^(-9));
      delta_E = 1.1*(10^(-20));
      TT = 0.99;
      Roc = 0.3;
      Kb = 1.38 * (10^(-23));

      ret_fun = e5(rj, rj1, N, l, n1j, n3j, Tj, R) - e3(Tj)*(n3j-2*n2j*exp(-delta_E/(Kb*Tj))) - n3j/tao_d2;


end
