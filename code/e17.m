function n0j = e17(Tj, j)
    Tw = 383;
    n01 = e18(Tw);
    if(j == 1)
      n0j = n01;
    elseif(j > 1)
      n0j = n01*(Tw/Tj);
    end
end
