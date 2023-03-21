l1=5;
l2=5;
range=2.5;
step=1;
t=1;
while true
    for a = -range:step:range
        H_x1=[0 5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        H_y1=[0 5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        H1=plot(H_x1,H_y1,'red');
        hold on
        H_x2=[5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),a];
        H_y2=[5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),8];
        H2=plot(H_x2,H_y2,'red');
        hold on
        H_x3=[-5 -5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        H_y3=[0 5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        H3=plot(H_x3,H_y3,'red');
        hold on
        H_x4=[-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),a-5];
        H_y4=[5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),8];
        H4=plot(H_x4,H_y4,'red');
        hold on
        body=rectangle('Position',[a-5 8 5 10]);
        hold on
        head=rectangle('Position',[a-5 18 5 6],'Curvature',[1,1]);
        hold on
        H_x5=[a a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        H_y5=[18 18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        H5=plot(H_x5,H_y5,'red');
        hold on
        H_x6=[a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),0];
        H_y6=[18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),26];
        H6=plot(H_x6,H_y6,'red');
        hold on
        H_x7=[a-5 a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        H_y7=[18 18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        H7=plot(H_x7,H_y7,'red');
        hold on
        H_x8=[a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),-5];
        H_y8=[18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),26];
        H8=plot(H_x8,H_y8,'red');     
        axis([-15 10 -2 35]);
        pause(0.3);
        delete(H1);
        delete(H2);
        delete(H3);
        delete(H4);
        delete(head);
        delete(body);
        delete(H5);
        delete(H6);
        delete(H7);
        delete(H8);
    end
    range=-range;
    step=-step;
    t=-t;
end