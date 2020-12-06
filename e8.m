function p_j_peak = e8(rj, rj1, N, R)
        Sj = e9(rj, rj1);
        iMax = e10(R, N);
        w_p = 500*(10^(-6));
        p_j_peak = Sj * iMax * exp(-2 * rj * rj/(w_p * w_p));
end
