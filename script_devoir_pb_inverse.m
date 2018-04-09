global omega_x L T theta Nt Nx;

L = 1;
T = 1;
omega_x = 5;
theta = 0.5;
Nt = 500;
Nx = 100;
delta_t = T/(Nt-1);

f = @(t)0.1*cos(omega_x*t);
u0 = @(x)0.1*(1-x);
u1 = @(x)0.1*cos(omega_x*delta_t)*(1-x);

