function gamma_l_j = e13(nj1, nj2, rj, rj1, l, Tj, N, R, P_l_j)
      v_l_j = e6(rj, rj1, l);
      R_oc = 0.3;
      TT = 0.99;
      nu_l = (299792458/(894.6*(10^-9)));
      h = 6.626 * power(10,-34);
      sigma_d1_he_broadened = e14(Tj);
      exp_unit = exp((nj2-nj1)* sigma_d1_he_broadened * l);
      gamma_l_j = P_l_j*((R_oc)/(1-R_oc)) * (exp_unit-1) * (1 + TT*TT*exp_unit) / (v_l_j * h * nu_l);
end
