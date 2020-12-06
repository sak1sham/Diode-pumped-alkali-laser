function v_eth = e4a(Tj)
    Kb = 1.38 * (10^(-23));
    mCs = 132.9 * 1.67 * (10^(-27));
    mEthane = 30.2  * 1.67 * (10^(-27));
    v_eth = sqrt(3*Kb*Tj*((1/mCs)+(1/mEthane)));
end
