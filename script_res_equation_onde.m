global T L omega_x alpha coeferr n;

num = 2;

%section 2c)
if num == 0
    T = 1;
    L = 1;
    n = 3;
    alpha = 1;
    omega_x = pi*n/L;
    coeferr = 0;

    u0 = @(x)sin(omega_x*x);
    u1 = @(x)sin(omega_x*x);
    f = @(t)0;
    c = 1;
    Nx = 100;
    Nt = 100;
    theta = 0;

    omega_t = sqrt(c)*pi*n/L;

    u_exacte = @(x, t)cos((n*pi/L)*t)*sin((n*pi/L)*x);

    [u, err] = resout_equation_onde(c, Nt, Nx, theta, f, u0, u1);

    %trace_solution(u, Nt, Nx);

    trace_comparaison_mode(u, Nt, Nx, u_exacte);
    t_inter = 0:L/(Nt-1):T;
    figure;
    plot(t_inter, err);
end

%section 2d)
if num == 1
    n = 2;
    T = 1;
    L = 1;
    alpha = 1;
    omega_x = pi*n/L;
    coeferr = 0;
    
    [u, err] = resout_equation_onde(1, 95, 100, 0, f, u0, u1);
    trace_solution(u, 95, 100);
    plot(0:L/(95-1):T, err);
    
    [u, err] = resout_equation_onde(1, 78, 100, 0.1, f, u0, u1);
    trace_solution(u, 78, 100);
    plot(0:L/(78-1):T, err);
    
    [u, err] = resout_equation_onde(1, 70, 100, 0.1, f, u0, u1);
    trace_solution(u, 70, 100);
    plot(0:L/(70-1):T, err);
    
    [u, err] = resout_equation_onde(1, 50, 100, 0.5, f, u0, u1);
    trace_solution(u, 50, 100);
    plot(0:L/(50-1):T, err);
    
    [u, err] = resout_equation_onde(1, 30, 100, 0.5, f, u0, u1);
    trace_solution(u, 30, 100);
    plot(0:L/(30-1):T, err);
    
end

%section 2f)
if num == 2
    n = 2;
    T = 5;
    L = 1;
    alpha = 1;
    omega_x = pi*n/L;
    coeferr = 1;
   
    Nt = 500;
    Nx = 100;
    theta = 0.5;
    c = 10;
    delta_t = T/(Nt-1);
    t_inter = 0:delta_t:T;
    f = @(t)0.1*cos(omega_x*sqrt(10)*t);
    u_0 = @(x)0.1*(1-x);
    u_1 = @(x)0.1*cos(omega_x*sqrt(10)*delta_t)*(1-x);
    
    [u, err] = resout_equation_onde(c, Nt, Nx, theta, f, u_0, u_1);
    trace_solution(u, Nt, Nx);
    
    
end






