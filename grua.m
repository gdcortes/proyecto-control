function yprima = grua(t,y) %solo brazo en elevacion, sin roce ni torque

Lb=5; % largo brazo
Mb=1000; % masa brazo
g=9.81;

Lf=2;
Mf=1000;


yprima(1)=y(2); %velocidad en elevacion (alfa)
yprima(2)= -0.7*(y(2))    +((1/2)*(y(4))^2*sin(2*y(1))*((1/3)*Mb*Lb^2+(1/12)*Mf*Lf^2+Mf*(Lb-y(5)+(Lf/2))^2) + g*sin(y(1))*(Mb*Lb/2+Mf*(Lb-y(5)+(Lf/2))) -y(2)*(-2*Mf*(Lb-y(5)+(Lf/2))*y(6))    )/ ((1/3)*Mb*Lb^2 +(1/12)*Mf*Lf^2  + Mf*(Lb-y(5)+(Lf/2))^2);
yprima(3)=y(4);
yprima(4)=(-(y(4))*(sin(y(1))^2)*(-2*Mf*(Lb-y(5)+(Lf/2))*y(6))-y(4)*sin(2*y(1))*((1/3)*Mb*(Lb^2)+(1/12)*Mf*(Lf^2)+Mf*(Lb-y(5)+(Lf/2))^2))/((sin(y(1))^2)*((1/3)*Mb*(Lb^2)+(1/12)*Mf*(Lf^2)+Mf*(Lb-y(5)+(Lf/2))^2));
yprima(5)=y(6);
yprima(6)=((1/2)*((y(2)^2)+(y(4)^2)*(sin(y(1))^2))*(-2*Mf*(Lb-y(5)+(Lf/2))*y(6))-g*cos(y(1))*(-Mf*y(6)))/Mf;

yprima=yprima';

end

