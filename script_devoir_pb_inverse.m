global omega_x L T theta Nt Nx coeferr c;

num = 1;

coeferr = 1;
L = 1;
T = 1; 
omega_x = 5;
theta = 0.5;
Nt = 100; %pour avoir un algo stable
Nx = 100;
c = 10;
delta_t = T/Nt;

f = @(t)0.1*cos(omega_x*t);
u0 = @(x)0.1*(1-x);
u1 = @(x)0.1*cos(omega_x*delta_t)*(1-x);

%section 2.1
if num == 0
    
    [u, err] = resout_equation_onde(c, Nt, Nx, theta, f, u0, u1);
    %trace_solution(u, Nt, Nx);

    c_intervale = 7:0.5:30;
    trace_fonction_objectif(u, c_intervale, f, u0, u1);

end

%section 2.2
if num == 1
    [u, err] = resout_equation_onde(c, Nt, Nx, theta, f, u0, u1);
    
    [c_fin, u_fin, err1] = pb_inv_secante(u, 50, 0.0000000001, 3, 3.1, f, u0, u1);
    disp(c_fin);
    %trace_solution(u_fin, Nt, Nx);
    figure;
    plot(1:length(err1), err1, '*');
    
    [c_fin, u_fin, err1] = pb_inv_secante(u, 50, 0.0000000001, 15, 15.1, f, u0, u1);
    disp(c_fin);
    %trace_solution(u_fin, Nt, Nx);
    figure;
    plot(1:length(err1), err1, '*');
    
    %on utilise 25 et 25.1 pour mieux montrer la divergence puisque on
    %utilise Nt = 100 ce qui change les donnees
    [c_fin, u_fin, err1] = pb_inv_secante(u, 50, 0.00001, 25, 25.1, f, u0, u1);
    disp(c_fin);
    figure;
    plot(1:length(err1), err1, '*');
    
    
end

