function v_he = e4b(Tj)
    Kb = 1.38 * (10^(-23));
    mCs = 132.9 * 1.67 * (10^(-27));
    mHe = 4 * 1.67 * (10^(-27));
    v_he = sqrt(3*Kb*Tj*((1/mCs)+(1/mHe)));
end
