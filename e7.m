function p_j_lambda = e7(lambda, rj, rj1, N, R)
        delta_lambda_d2_FWHM = 0.06*(10^-9);
        lambda_o = 852.1*(10^(-9));
        term2 = 2*sqrt(2*log(2));
        term_sq = power(delta_lambda_d2_FWHM/term2,2);
        p_j_lambda = e8(rj, rj1, N, R) * exp(-power(lambda - lambda_o,2)/(2*term_sq)) / sqrt(2*pi * term_sq);
end
