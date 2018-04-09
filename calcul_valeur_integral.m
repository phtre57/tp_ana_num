function J=calcul_valeur_integral(u_c, u_ex)
    global Nt T;
    x_capteur = 4;
    uc_moins_uex = zeros(Nt);
    
    for i=1:Nt
        uc_moins_uex(i) = abs(u_c(x_capteur, i) - u_ex(x_capteur, i))^2;
    end
    
    h = T/(Nt-1);
    
    for i=1:Nt
       if i == 1
           J = J + uc_moins_uex(i);
           
       elseif i == Nt
           J = J + uc_moins_uex(i);
        
       else
           J = J + 2*uc_moins_uex(i);
       end
       
    end
    
    J = J*(h/2);
end