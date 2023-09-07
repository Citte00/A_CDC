function dydt = ode_system(t, y)
    calpha   = 0.68;
    cbeta    = 0.8;
    cgrMax   = 5e-6;        
    cgamma   = 0.8;        
    cQ10gr   = 1.6;            
    Tc       = 20;             
    ctau     = 0.15;           
    crespSHT = 3.47e-7;         
    crespRT  = 1.16e-7;         
    cQ10resp = 2;               
    ck        = 0.9;            
    clar      = 75e-3;          
    Upar      = 45;             
    gammaCO2  = 800;            
    comega    = 1.83e-3;        
    cGamma    = 40;             
    cQ10gamma = 2;             
    cepsilon  = 17e-6;         
    gbnd      = 7e-3;          
    gstm      = 5e-3;          
    ccar1     = -1.32e-5;      
    ccar2     = 5.94e-4;       
    ccar3     = -2.64e-3;      

    gcar      = ccar1 * Tc^2 + ccar2 * Tc + ccar3;
    gCO2      = (1/gbnd + 1/gstm + 1/gcar)^-1;      
    Gamma     = cGamma * cQ10gamma^((Tc - 20)/10);                     
    epsilon   = cepsilon * (gammaCO2 - Gamma) / (gammaCO2 + 2*Gamma);  
    fphotmaxn = epsilon * Upar * gCO2 * comega * (gammaCO2 - Gamma);   
    fphotmaxd = epsilon * Upar + gCO2 * comega * (gammaCO2 - Gamma);   
    fphotmax  = fphotmaxn / fphotmaxd;    

    fphot = @(u) (1 - exp(-ck*clar*(1 - ctau) * u)) * fphotmax;
    fresp = @(u) (crespSHT*(1 - ctau)*u + crespRT * ctau * u) * cQ10resp^((Tc - 25)/10);
    rgr = @(u, v) cgrMax * u / (u + cgamma * v) * cQ10gr^((Tc - 20)/10);

    f1 = @(u, v) calpha*fphot(v) - rgr(u,v)*v - fresp(v) - (1-cbeta)/cbeta*rgr(u,v)*v;
    f2 = @(u, v) rgr(u,v)*v;

    dydt = [f1(y(1), y(2)); f2(y(1), y(2))];
end