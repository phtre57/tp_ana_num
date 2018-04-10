
function [u, erreur] = resout_equation_onde(c, Nt, Nx, theta, f, u0, u1tilde)
    global coeferr;
    global L;
    global T;
    global omega_x;
    erreur=[];
    
    
    delta_x = L/(Nx-1);
    delta_t = T/(Nt-1);
    
    delta_x_p = L/Nx;
    delta_t_p = T/Nt;
    
    x_inter = 0:delta_x:L;
    t_inter = 0:delta_t:T;
    
    u = zeros(Nx, Nt);
    
    u(:,1) = u0(x_inter);
    u(:,2) = u1tilde(x_inter);
    
    u_0 = u(:,1);
    u_1 = u(:,2);
    
    coef = c*((delta_t_p)^2/(delta_x_p)^2);
    
    A = toeplitz([1+2*theta*coef -theta*coef zeros(1, Nx-2)]);
    B0 = toeplitz([2 - 2*(1-2*theta)*coef (1-2*theta)*coef zeros(1, Nx-2)]);
    B1 = toeplitz([-1-2*theta*coef theta*c  zeros(1, Nx-2)]);
    
    A(1,1) = 1;
    A(1,2) = 0;
    
    A(Nx, Nx) = 1;
    A(Nx, Nx-1) = 0;
    
    for i = 3:Nt
        b_n = B0*u_1 + B1*u_0;
        b_n(1) = f(t_inter(i));
        b_n(Nx) = 0;
        
        u_n_plus_1 = A\b_n;
        u_0 = u_1;
        u_1 = u_n_plus_1;
        
        u(:,i) = u_n_plus_1;
        
    end
    
    if coeferr == 1
       erreur = []; 
       
    elseif coeferr == 0
        erreur = zeros(Nt);
        u_exacte = @(x, t)cos(sqrt(c)*omega_x*t)*sin(omega_x*x);
        
        u_e = zeros(Nx, Nt);
        for i=1:Nt
            u_e(:,i) = u_exacte(x_inter, t_inter(i));
        end
        
        for i=1:Nt
            erreur(i) = norm(u_e(:,i) - u(:,i));
        end
    end;
    
   
end





