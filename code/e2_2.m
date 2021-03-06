function ret_fun = e2_2(rj, rj1, N, Tj, n1j, n2j, n3j, R, P_l_j)
      l = 0.025;
      tao_d1 = 34.9*(10^(-9));
      tao_d2 = 30.5*(10^(-9));
      delta_E =  1.1*(10^(-20));
      TT = 0.99;
      Roc = 0.3;
      Kb = 1.38 * (10^(-23));

      ret_fun = -e13(n1j, n2j, rj, rj1, l, Tj, N, R, P_l_j) + e3(Tj)*(n3j-2*n2j*exp(-delta_E/(Kb*Tj))) - n2j/tao_d1;


end
