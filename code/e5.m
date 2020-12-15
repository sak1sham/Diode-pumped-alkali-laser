function gamma_p_j = e5(rj, rj1, N, l, nj1, nj3, Tj, R)
        % Second term in the integral is (=1) because R_p is assumed to be 0. (No reflectance of pump beam)
        eta_del = 0.9;
        h = 6.626 * power(10,-34);
        c = 299792458;
      	sum = 0;
      	w_p = 500 * (10^-6);
        lambda = 851.5*power(10,-9);
      	dx = 0.1*power(10,-9);
        Rp = 0.2;

        while(lambda<=(852.7*power(10,-9)))
              	sum = sum + (lambda * e7(lambda, rj, rj1, N, R) * (1-exp(-(nj1-nj3/2)*e11(Tj, lambda)*l)) * (1+Rp*exp(-(nj1-nj3/2)*e11(Tj, lambda)*l)));
      		    lambda = lambda + dx;
        end

        if(rj > w_p)
          gamma_p_j = 0;
        else
          gamma_p_j = eta_del*sum/(e6(rj, rj1, l)*h*c);
        end
        
end
