function Y32 = e3(Tj)
      Na = 6.022*power(10,23);
      R = 0.082 * power(10,-3);
      P_eth = 0.1316;
      P_he = 0.63;
      nEthane = P_eth * Na /(R * Tj);
      nHe = P_he * Na /(R * Tj);
      sigmaEthane = 5.2 * (10^(-19));
      sigmaHe = 2.25 * (10^(-23));
      Y32 = nEthane*sigmaEthane*e4a(Tj) + nHe*sigmaHe*e4b(Tj);
end
