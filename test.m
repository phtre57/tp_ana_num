global T L omega_x alpha coeferr n;
T = 1;
L = 1;
n = 2;
alpha = 1;
omega_x = pi*n/L;
coeferr = 1;

u0 = @(x)sin(omega_x*x);
u1 = @(x)sin(omega_x*x);
f = @(t)0;
c = 1;
Nx = 100;
Nt = 100;
theta = 0;

omega_t = sqrt(c)*pi*n/L;

u_exacte = @(x, t)cos((2*pi/L)*t)*sin((2*pi/L)*x);

[u, err] = script_res_equation_onde(c, Nt, Nx, theta, f, u0, u1);

%trace_solution(u, Nt, Nx);

trace_comparaison_mode(u, Nt, Nx, u_exacte);



