xA = 60; yA = 60; zA = 60;
xB = 80; yB = 80; zB = 60;
l1 = 20; l2 = 50; l3 = 40;

% syms l1 l2 l3 th1 th2 th3;
% R1 = [cos(th1) -sin(th1) 0 0; sin(th1) cos(th1) 0 0; 0 0 1 0; 0 0 0 1];
% T1 = [1 0 0 0; 0 1 0 0; 0 0 1 l1; 0 0 0 1];
% R2 = [1 0 0 0; 0 cos(th2) -sin(th2) 0; 0 sin(th2) cos(th2) 0; 0 0 0 1];
% T2 = [1 0 0 0; 0 1 0 l2; 0 0 1 0; 0 0 0 1];
% R3 = [1 0 0 0; 0 cos(th3) -sin(th3) 0; 0 sin(th3) cos(th3) 0; 0 0 0 1];
% T3 = [1 0 0 0; 0 1 0 l3; 0 0 1 0; 0 0 0 1];
% P4 = [0;0;0;1];
% 
% P0 = R1 * T1 *R2 * T2 * R3 * T3 * P4;
% simplify(P0);
% Px = P0(1);
% Py = P0(2);
% Pz = P0(3);

for t=0:0.01:1
    x = xA + (xB-xA)*t;
    y = yA + (yB-yA)*t;
    z = zA + (zB-zA)*t;
    th1 = atan2(-x,y);
    A = (-x/sin(th1));
    B = z - l1;
    c3 = (A^2 + B^2 - l2^2 - l3^2) /2 * l2 * l3;
    s3 = sqrt(abs(1 - c3^2));
    th3 = atan2(s3,c3);
    c2 = A * (l2 + l3 * c3) + B * l3 * s3;
    s2 = B * (l2 + l3 * c3) + A * l3 * s3;
    th2 = atan2(s2,c2);
    Px = -sin(th1) * (l2 * cos(th2)) + l3 * cos(th2 + th3);
    Py = cos(th1) * (l3 * cos(th2+th3) + l2 * cos(th2));
    Pz = l1 + l3 * sin(th2 + th3) + l2 * sin(th2);
    subplot(2,1,1);
    th1 = th1 * 180/pi;
    th2 = th2 * 180/pi;
    th3 = th3 * 180/pi;
    plot(t,th1,'.',Color='red');
    plot(t,th2,'.',Color='green');
    plot(t,th3,'.',Color='blue');
    hold on;
    subplot(2,1,2)
    plot3(Px,Py,Pz,'*', Color='blue');
    hold on;
    grid on;
end