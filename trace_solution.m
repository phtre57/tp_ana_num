function trace_solution(u, Nt, Nx)
    global L;
    
    delta_x = L/(Nx-1);
    x_inter = 0:delta_x:L;
    
    %frame = getframe;
    %[im,map] = rgb2ind(frame.cdata,256,'nodither');
    
    figure;
    h = plot(x_inter, u(:,1), '*');
    axis([0 1 -1 1]);
    
    for i=2:Nt
        set(h,'xdata',x_inter,'ydata',u(:,i));
        drawnow;
        pause(0.05);
        %frame = getframe;
        %im(:,:,1,i) = rgb2ind(frame.cdata,map,'nodither');
    end
    %imwrite(im,map,'test.gif','DelayTime',0,'LoopCount',inf);

end