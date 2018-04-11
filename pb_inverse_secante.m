function [cfinal, ufinal, tab_err] = pb_inverse_secante(u_ex, nmax, precision, c0, c1, f, u0, u1)
    global Nt Nx coeferr theta;
    coeferr = 1;
    
    x_n = c1;
    x_n_moins_1 = c0;
    stop = 0;
    increment = 1;

    while stop == 0
        [f_x_n, err0] = resout_equation_onde(x_n, Nt, Nx, theta, f, u0, u1);
        [f_x_n_moins_1, err1] = resout_equation_onde(x_n_moins_1, Nt, Nx, theta, f, u0, u1);
        j_uc_n = calcul_valeur_integral(f_x_n, u_ex);
        j_uc_n_moins_1 = calcul_valeur_integral(f_x_n_moins_1, u_ex);
        
        temp = x_n;
        x_n = x_n - (j_uc_n*(x_n - x_n_moins_1)/(j_uc_n - j_uc_n_moins_1));
        x_n_moins_1 = temp;
        
        if (abs(x_n - x_n_moins_1)/abs(x_n) + eps) < precision
            cfinal = x_n;
            [ufinal, err2] = resout_equation_onde(x_n, Nt, Nx, theta, f, u0, u1);
            stop = 1;
        end
        
        %divergence
        if (increment > nmax)
            stop = 1;
        end
        
        increment = increment + 1;
    end
    
    tab_err = 0;

end