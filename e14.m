function sigma_d1_he_broadened = e14(Tj)
    sigma_d1_radioactive = 1.53*(10^(-13));
    R = 0.082 * power(10,-3);
    P_he = 0.63;
    nHe = P_he/(Tj*R*44.615);
    tao_d1 = 34.9;
    sigma_d1_he_broadened = sigma_d1_radioactive/(2*pi*tao_d1*nHe*21.5*sqrt(Tj/294));
end
