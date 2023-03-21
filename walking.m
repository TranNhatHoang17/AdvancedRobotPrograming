l1 = 30;
l2 = 30;
l0 = 0;
Hx = 20; Hy =50;

c2 = ((Hx-l0)^2 + Hy^2 - l1^2 - l2^2) / (2*l1*l2);
s2 = sqrt(abs(1 - c2^2));
a2 = atan2(s2, c2);

s1 = ((Hx-l0) * (l1+l2*c2) - Hy*(l2*s2)) / ((l1+l2*c2)*(l1+l2*c2)-(-l2*s2)*(l2*s2));
c1 = ((-(Hx-l0) * s2) + Hy*(l1+l2*c2)) / ((l1+l2*c2)*(l1+l2*c2)-(-l2*s2)*(l2*s2));
a1 = atan2(s1, c1);
a1_0=atan2(s1, c1);
a2_0=atan2(s2, c2);
a3 = -2*a1_0;
a4 = -2*a2_0;

Px_1 = Hx + l1 * s1;
Py_1 = Hy - l1 * c1;
Px_2 = Px_1 + l2 * sin(a1+a2);
Py_2 = Py_1 - l2 * cos(a1+a2);
Px_3 = Hx + l1 * sin(a3);
Py_3 = Hy - l1 * cos(a3);
Px_4 = Px_3 + l2 * sin(a3+a4);
Py_4 = Py_3 - l2 * cos(a3+a4);
rectangle('Position',[Hx-10, Hy, 20, 40]);
rectangle('Position',[Hx-10 Hy+40 20 20],'Curvature',[1,1]);
line([Hx, Px_1], [Hy, Py_1]);
line([Px_1, Px_2], [Py_1, Py_2]);
line([Hx, Px_3], [Hy, Py_3]);
line([Px_3, Px_4], [Py_3, Py_4]);
set(gca, 'DataAspectRatio',[1 1 1]);
axis([-150 150 0 150]);
hold on;
v =20;
dt=0.1;
while((a1 <= a1_0)&&(a1>=-0.45))
    Hx = Hx - dt*v;
    w1_0 = -v/(l1*cos(a1_0));
    w2_0 = -w1_0;
    %update value for parameters
    a1 = a1-w1_0*dt;
    a2 = a2-w2_0*dt;
    Px_1 = Hx + l1*sin(a1); Py_1 = Hy - l1*cos(a1);
    Px_2 = Px_1 +l2*sin(a1+a2); Py_2 = Py_1 -l2*cos(a1+a2);
    a3 = a3+w1_0*dt/3;
    a4 = a4+w2_0*dt/3;
    Px_3 = Hx + l1*sin(a3); Py_3 = Hy - l1*cos(a3);
    Px_4 = Px_3 +l2*sin(a3+a4); Py_4 = Py_3 -l2*cos(a3+a4);
    %rewrite 
    clf;
    rectangle('Position',[Hx-10, Hy, 20, 40]);
    rectangle('Position',[Hx-10 18 5 6],'Curvature',[1,1]);
    line([Hx, Px_1], [Hy, Py_1]);
    line([Px_1, Px_2], [Py_1, Py_2]);
    hold on;
    line([Hx, Px_3], [Hy, Py_3]);
    line([Px_3, Px_4], [Py_3, Py_4]);
    axis([-200 100 0 100]);
    set(gca, 'DataAspectRatio',[1 1 1]);
    pause(dt);
end
for t=0:dt:10
    %step1
    a1 = -0.45;
    a2 = 0.2;
    a3 = a1_0;
    a4 = 0.5*a2_0;
    %step2
    while ((a3 <= a1_0)&&(a3>=-0.45))
        Hx = Hx - dt*v;
        w1_0 = -v/(l1*cos(a1_0));
        w2_0 = -w1_0;
        %update value for parameters
        a1 = a1-w1_0*dt;
        a2 = a2-w2_0*dt*(0.45+a1_0*10)/(a1_0*10);
        Px_1 = Hx + l1*sin(a1); Py_1 = Hy - l1*cos(a1);
        Px_2 = Px_1 +l2*sin(a1+a2); Py_2 = Py_1 -l2*cos(a1+a2);
        a3 = a3+w1_0*dt;
        a4 = a4+w2_0*dt;
        Px_3 = Hx + l1*sin(a3); Py_3 = Hy - l1*cos(a3);
        Px_4 = Px_3 +l2*sin(a3+a4); Py_4 = Py_3 -l2*cos(a3+a4);
        %rewrite 
        clf;
        rectangle('Position',[Hx-10, Hy, 20, 40]);
        rectangle('Position',[Hx-10 Hy+40 20 20],'Curvature',[1,1]);
        line([Hx, Px_1], [Hy, Py_1]);
        line([Px_1, Px_2], [Py_1, Py_2]);
        hold on;
        line([Hx, Px_3], [Hy, Py_3]);
        line([Px_3, Px_4], [Py_3, Py_4]);
        axis([-150 150 0 150]);
        set(gca, 'DataAspectRatio',[1 1 1]);
        pause(dt);
    end
end