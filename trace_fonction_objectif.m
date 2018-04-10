function trace_fonction_objectif(u_exp, c_intervalle, f, u0, u1tilde)
    global Nt Nx coeferr theta;
    coeferr = 1;
    temp_j = zeros(length(c_intervalle));
    
    for i=1:length(c_intervalle)
        [u, err] = resout_equation_onde(c_intervalle(i), Nt, Nx, theta, f, u0, u1tilde);
        temp_j(i) = calcul_valeur_integral(u, u_exp);
    end
    
    plot(c_intervalle, temp_j, '*');
    
    
    
end