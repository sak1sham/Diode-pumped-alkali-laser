function ret_fun = e2_1(rj, rj1, N, Tj, n1j, n2j, n3j, R, P_l_j)
      l = 0.025;
      tao_d1 = 34.9*(10^(-9));
      tao_d2 = 30.5*(10^(-9));
      ret_fun = -e5(rj, rj1, N, l, n1j, n3j, Tj, R) + e13(n1j, n2j, rj, rj1, l, Tj, N, R, P_l_j) + (n2j/tao_d1) + (n3j/tao_d2);
end
