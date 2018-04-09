function trace_comparaison_mode(u, Nt, Nx, uexacte)
    global L T;
    
    delta_x = L/(Nx-1);
    delta_t = T/(Nt-1);
    x_inter = 0:delta_x:L;
    t_inter = 0:delta_t:T;
    
    u_e = zeros(Nx, Nt);
    for i=1:Nt
       u_e(:,i) = uexacte(x_inter, t_inter(i));
    end
    
    
    h = plot(x_inter, u(:,1), '*');
    hold on;
    g = plot(x_inter, u_e(:,1), 'o');
    axis([0 1 -1 1])
    
    for i=2:Nt
        set(h(1),'xdata', x_inter, 'ydata', u(:,i));
        set(g(1),'xdata', x_inter, 'ydata', u_e(:,i));
        drawnow;
        pause(0.05);
    end
    
end