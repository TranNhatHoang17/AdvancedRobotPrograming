l1 = 15; l2 =20;

C1x = 10;  C1y = 10; C1z = 10;
C2x = 10;  C2y = 25; C2z = 10;
C3x = 10;  C3y = 40; C3z = 10;
C4x = -10; C4y = 40; C4z = 10;
C5x = -10; C5y = 25; C5z = 10;
C6x = -10; C6y = 10; C6z = 10;

Cx =[C1x,C2x,C3x,C4x,C5x,C6x];
Cy =[C1y,C2y,C3y,C4y,C5y,C6y];
Cz =[C1z,C2z,C3z,C4z,C5z,C6z];

B1x = 20;  B1y = 10; B1z = 0;
B2x = 20;  B2y = 25; B2z = 0;
B3x = 20;  B3y = 40; B3z = 0;
B4x = -20; B4y = 40; B4z = 0;
B5x = -20; B5y = 25; B5z = 0;
B6x = -20; B6y = 10; B6z = 0;

Bx =[B1x,B2x,B3x,B4x,B5x,B6x];
By =[B1y,B2y,B3y,B4y,B5y,B6y];
Bz =[B1z,B2z,B3z,B4z,B5z,B6z];

Ax =[0,0,0,0,0,0];
Ay =[0,0,0,0,0,0];
Az =[0,0,0,0,0,0];

for i=1:1:6
    [Ax(i),Ay(i),Az(i)] = leg(l1,l2,Cx(i),Cy(i),Cz(i),Bx(i),By(i),Bz(i));
end
%visualize
plot3([C1x,C2x,C3x,C4x,C5x,C6x,C1x],[C1y,C2y,C3y,C4y,C5y,C6y,C1y],[C1z,C2z,C3z,C4z,C5z,C6z,C1z]);
hold on;

for i=1:1:6
    plot3([Cx(i),Ax(i),Bx(i)], [Cy(i),Ay(i),By(i)], [Cz(i),Az(i),Bz(i)]);
    hold on;
end
axis([-40 40 0 200 0 30]);
set(gca, 'DataAspectRatio',[1 1 1]);
% each leg will move along a cycloid curve with radius  = r and the
% velocity of the spider is v
v =2.5;
r =2.5;
w = 1;
T = 2*pi/w;
% time step:
dt = 0.05;
%total time
TimeTotal = 30;

step1=1;
step2=0;
step3=0;
time = 0;
for t = 0:dt:TimeTotal
    % the spider will move in 3 step:
    if (step1)
        for i = 1:1:6
           
        end
        for i = 1:1:6
            if (mod(i,2)==0)
                By(i) = By(i) +v *(1- cos(w*(t-time)))*dt;
                Bz(i) = Bz(i) + v*sin(w*(t-time))*dt;
            end 
        end
        for i=1:1:6
            [Ax(i),Ay(i),Az(i)] = leg(l1,l2,Cx(i),Cy(i),Cz(i),Bx(i),By(i),Bz(i));
        end
        if ((t-time)>=T)
            step1 =0;
            step2 =1;
            step3 =0;
            time = t;
        end
    end
    %---------------------------------------------------
    %step2
    if (step2)
        for i = 1:1:6
            Cy(i) = Cy(i)+v*dt;
        end
        for i = 1:1:6
            if (mod(i,2)==1)
                By(i) = By(i) + 2 *v *(1- cos(w*(t-time)))*dt;
                Bz(i) = Bz(i) + 2 * v * sin(w*(t-time))*dt;
            end 
        end
        for i=1:1:6
            [Ax(i),Ay(i),Az(i)] = leg(l1,l2,Cx(i),Cy(i),Cz(i),Bx(i),By(i),Bz(i));
        end
        if ((t-time)>=T)
            step1 =0;
            step2 =0;
            step3 =1;
            time = t;
        end
    end
    %---------------------------------------------------
    %step2
    if (step3)
        for i = 1:1:6
            Cy(i) = Cy(i)+v*dt;
        end
        for i = 1:1:6
            if (mod(i,2)==0)
                By(i) = By(i) + 2 * v *(1- cos(w*(t-time)))*dt;
                Bz(i) = Bz(i) + 2 * v*sin(w*(t-time))*dt;
            end 
        end
        for i=1:1:6
            [Ax(i),Ay(i),Az(i)] = leg(l1,l2,Cx(i),Cy(i),Cz(i),Bx(i),By(i),Bz(i));
        end
        if ((t-time)>=T)
            step1 =0;
            step2 =1;
            step3 =0;
            time = t;
        end
    end

    %redraw
    clf;
    plot3([Cx(1),Cx(2),Cx(3),Cx(4),Cx(5),Cx(6),Cx(1)],[Cy(1),Cy(2),Cy(3),Cy(4),Cy(5),Cy(6),Cy(1)],[Cz(1),Cz(2),Cz(3),Cz(4),Cz(5),Cz(6),Cz(1)]);
    hold on;

    for i=1:1:6
        plot3([Cx(i),Ax(i),Bx(i)], [Cy(i),Ay(i),By(i)], [Cz(i),Az(i),Bz(i)]);
        hold on;
    end
    axis([-40 40 0 200 0 30]);
    set(gca, 'DataAspectRatio',[1 1 1]);
    pause(dt*0.001);
end

            
           
                
                
                
        

