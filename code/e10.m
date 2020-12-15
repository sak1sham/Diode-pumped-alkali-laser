function iMax = e10(R, N)
    Pp = 20;
    sum = 0;
    w_p = 500*(10^(-6));
    for j = 1:N+1
        rj = R-((j-1)*R/N);
        rj1 = R-(j*R/N);
        if(rj > w_p)
            continue;
        else
            sum = sum + e9(rj, rj1)*exp(-2*(rj*rj)/(w_p*w_p));
        end
    end
    iMax = Pp/sum;
end
