global omega_x L T theta Nt Nx coeferr;

coeferr = 1;
L = 1;
T = 5;
omega_x = 5;
theta = 0.5;
Nt = 500;
Nx = 100;
delta_t = T/Nt;

f = @(t)0.1*cos(omega_x*t);
u0 = @(x)0.1*(1-x);
u1 = @(x)0.1*cos(omega_x*delta_t)*(1-x);


[u, err] = resout_equation_onde(10, Nt, Nx, theta, f, u0, u1);
%trace_solution(u, Nt, Nx);

c_intervale = 7:0.5:30;
trace_fonction_objectif(u, c_intervale, f, u0, u1);

