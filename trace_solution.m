function trace_solution(u, Nt, Nx)
    global L;
    
    delta_x = L/(Nx-1);
    x_inter = 0:delta_x:L;
    
    h = plot(x_inter, u(:,1), '*');
    axis([0 1 -1 1])
    
    for i=2:Nt
        set(h(1),'xdata',x_inter,'ydata',u(:,i));
        drawnow;
        pause(0.05);
    end

end