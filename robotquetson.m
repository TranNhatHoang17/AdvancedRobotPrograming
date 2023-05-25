R=100; b=10; p=5;
for t=0:0.1:100*pi
    x=(R-b)*cos(t);
    y=(R-b)*sin(t);
    z=p*t/20;
    t1=atan2(-x,y);
    l1=z;
    l2=sqrt(x^2+y^2);
    Px=-l2*sin(t1);
    Py=l2*cos(t1);
    Pz=l1;
    subplot(1,2,1);
    plot(t,t1*180/pi,'-*',t,l1,'-^',t,l2,'--');
    hold on;
    subplot(1,2,2);
    plot3(Px,Py,Pz,'*');
    hold on;
    pause(0.0000001);
end

