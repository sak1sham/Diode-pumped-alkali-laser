function n01 = e18(Tw)
        super = 8.22127 - (4006.048/Tw) - (0.00060194*Tw) - (0.19623*log10(Tw));
        Na = 6.02214076 * power(10,23);
        R = 8.3143;
        n01 = ( 133.322* Na * power(10,super) )/ (R * Tw);
end
