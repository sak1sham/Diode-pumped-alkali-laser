%
%   DETAILS:
%   Author: SAKSHAM GARG, under guidance of Dr. B.S. Solanki, Scientist E - LASTEC, DRDO
%   Email - ch1180927@iitd.ac.in
%   Language - Octave/MATLAB - (Octave preferable)
%   Paper: Algorithm for evaluation of temperature distribution of a vapor cell in a diode-pumped alkali laser system: part I
%   To run the program save all function files in same directory and run the main.m file
%   Equation number in the pdf is the name of the function file: eg- equation 2 : e2.m, equation 2(a) : e2_1.m etc.
%

% MAIN PROGRAM STARTS HERE: %


% On Running the program, you will at first see moving plots of Number
% density vs time for different paramters. After the program completes, it
% gives the final plot of temperature distribution and number densities as
% a function of radius.

Tw = 383;

%FOLLOWING PARAMETERS ARE TO BE ENTERED BY THE USER
N = 150;
P_Thermal = 1;
P_p = 10;
R = 7.50*(10^-4);
% Moreover, equations 5, 8 and 10 need the input for the waist radius

% FOLLOWING PARAMETERS ARE PREDEFINED BY THE PROGRAM
P_he = 0.63;
P_eth = 0.1316;
l = 0.025;
TT = 0.99;
R_oc = 0.3;
Q = zeros(1,N);
Rad = zeros(1,N);
N1j = zeros(1,N);
N2j = zeros(1,N);
N3j = zeros(1,N);
T = zeros(1,N);
Rad(1) = R;
i = 0;

while(abs((P_Thermal-abs(sum(Q)))/P_Thermal)>0.05 && P_Thermal<P_p)
          T = zeros(1,N);
          Q = zeros(1,N);
          T(1) = Tw;
          P_Thermal = P_Thermal + 0.1;
          for j = 1:N
                rj = R - ((j-1)*R/N);
                rj1 = R - (j*R/N);
                Rad(j+1) = rj1;
                
                P_l_j = abs((P_p-P_Thermal)*(exp(-2*(rj1^2)/(R^2)) - exp(-2*(rj^2)/(R^2))));
                

                [Qj, Omega_j, n1j, n2j, n3j] = e2(rj, rj1, N, T(j), j,R, P_l_j);
                

                Q(j) = Qj;
                N1j(j+1) = n1j;
                N2j(j+1) = n2j;
                N3j(j+1) = n3j;
                
                K_he = 0.05516 + (3.2540*power(10,-4)*T(j)) - (2.2723*power(10,-8)*((T(j))^2));
                K_eth = -0.01936 + (1.2547*power(10,-4)*T(j)) + (3.8298*power(10,-8)*((T(j))^2));
                K = (P_he*K_he + P_eth*K_eth)/(P_he + P_eth);

                if(j<N)
                    phi_j = P_Thermal - sum(Q);
                    C1 = (Omega_j*rj*rj/(2*K)) - (phi_j*rj/(K*2*pi*rj*l));
                    C0 = T(j) + (Omega_j*rj*rj)/(4*K) - C1*log(rj);
                    T(j+1) = C1*log(rj1) - ((Omega_j*rj1*rj1)/(4*K)) + C0;
                else
                    C0 = T(j) + (Omega_j*rj*rj)/(4*K);
                    T(j+1) = - ((Omega_j*rj1*rj1)/(4*K)) + C0;
                end

                %disp('T(j+1) = ');
                %disp(T(j+1));
                %disp('Q(j) = ');
                %disp(Qj);
                %disp('n1j+n2j+n3j = ');
                %disp(n1j+n2j+n3j);
                %disp('n0 = ');
                %disp(e17(T(j+1),j));
                %disp('BC-2 = ');
                bc2 = exp(2*(n2j-n1j)*e14(T(j+1))*l*0.001)*TT*TT*R_oc;
                %disp(bc2);

                if(abs(((n1j+n2j+n3j)-(e17(T(j+1),j)))/(e17(T(j+1),j)))>=(0.1) || abs(bc2-1)>=5)
                       disp('n1j,n2j,n3j condition not satisfied....breaking the loop to change P_Thermal');
			           break
		            else
                       %disp('...n1j, n2j and n3j satisfying the boundary conditions');
                end


                %disp('Q = ');
                %disp(Q);
                %disp('T = ');
                %disp(T);
          end

          disp('P_Thermal = ');
          disp(P_Thermal);
          disp('Sum of Q is: ');
          disp(sum(Q));
          disp('..............................................................................');
          i = i+1;  
end

% It is recommended to keep atleast one of the following sections commented
%------------- Following 5 lines will plot the temperature profile ------
%disp(Rad);
%disp(T);
plot(Rad, T);
xlabel('Rad');
ylabel('Temp');

% -----Following lines plot Number Densities as a function of Radius----- 
% figure(1);
% semilogx(Rad, N1j);
% hold on;
% semilogx(Rad, N2j);
% semilogx(Rad, N3j);
% hold off;
% grid;
% legend('n1', 'n2', 'n3', 'Location', 'SW');
% title('n vs Rad');
% xlabel('Rad');
% ylabel('n2');

