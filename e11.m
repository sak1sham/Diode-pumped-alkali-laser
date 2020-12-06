function sigma_d2 = e11(Tj, lambda)
        lambda_d2 = 852.3*(10^-9);
        delta_lambda_d2_FWHM = 0.06*(10^-9);
        sigma_d2 = e12(Tj)/(1+(((lambda-lambda_d2)/(delta_lambda_d2_FWHM/2))^2));
end
