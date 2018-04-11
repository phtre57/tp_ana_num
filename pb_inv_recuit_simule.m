function [cfinal, iter] = pb_inv_recuit_simule(u_ex, cini, vois, nmax, f, u0, u1)

    global Nt Nx theta;
    
    r = 100;
    alpha = 0.8;
    
    iter = 0;
    [u, err] = resout_equation_onde(cini, Nt, Nx, theta, f, u0, u1);
    y0 = calcul_valeur_integral(u, u_ex);
    cfinal = cini;
    y_glob = y0;
    
    while (r > 0.0001 && iter <= nmax)
        x1 = cini + vois*(rand-0.7);
        [u, err] = resout_equation_onde(x1, Nt, Nx, theta, f, u0, u1);
        y1 = calcul_valeur_integral(u, u_ex);
        
        if y1 < y0
            cini = x1;
            y0 = y1;
        else
            p = rand(0,1);
            if p < exp((-y1-y0)/r)
                r = alpha*r;
                cini = x1;
                y0 = y1;
            end
        end
        
        if y1 < y_glob
            y_glob = y1;
            cfinal = x1;
        end
        iter = iter + 1;
    end
end