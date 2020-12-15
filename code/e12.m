function sigma_d2_he_broadened = e12(Tj)
    sigma_d2_radioactive = 2.31*(10^(-13));
    R = 0.082 * power(10,-3);
    P_he = 0.63;
    nHe = P_he/(Tj*R*44.615);
    tao_d2 = 30.5;
    sigma_d2_he_broadened = sigma_d2_radioactive/(2*pi*tao_d2*nHe*19.3*sqrt(Tj/294));
end
