function [Qj, Omega_j, n1j, n2j, n3j] = e2(rj, rj1, N, Tj, j, R, P_l_j)
      deltaE =  1.1*(10^(-20));
      l = 0.025;
      Kb = 1.38 * (10^(-23));
      % Following 3 lines solve the equations 2a, 2b and 2c as a function
      % of time. Here time is varying from 0 to 0.0005. After that, the
      % constant number densities are taken as the steady state.
      f = @(t, x) [e2_1(rj, rj1, N, Tj, x(1), x(2), x(3), R, P_l_j); e2_2(rj, rj1, N, Tj, x(1), x(2), x(3), R, P_l_j); e2_3(rj, rj1, N, Tj, x(1), x(2), x(3), R)];
      init_n1 = e17(Tj, j);
      [t, xa] = ode15s(f, [0,0.0005], [init_n1, 0, 0]);
      
      %--------------------------------------------------------------
      % Following lines plot the number density as a function of time
      % We take the final steady state number densities
      % ------------------------------------------------------------
      figure(1);
      semilogx(t, xa(:, 1));
      hold on;
      semilogx(t, xa(:, 2));
      semilogx(t, xa(:, 3));
      hold off;
      grid;
      legend('n1', 'n2', 'n3', 'Location', 'SW');
      title('n vs t');
      xlabel('t');
      ylabel('n2');
      
      % Following 3 lines take the final value of number densities (steady)
      n1j = xa(length(xa)-1,1);
      n2j = xa(length(xa)-1,2);
      n3j = xa(length(xa)-1,3);
      
      % Now, we calculate the omega and heat released.
      Omega_j = abs((e3(Tj))*(n3j - (2*n2j*exp(-deltaE/(Kb*Tj)))) * deltaE);    
      Qj = Omega_j*e6(rj, rj1, l);
end
