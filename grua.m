function yprima = grua(t,y) %solo brazo en elevacion, sin roce ni torque

Lb=2; % largo brazo
Mb=1; % masa brazo
g=9.81;


yprima(1)=y(2); %velocidad en elevacion (alfa)
yprima(2)=((1/2)*(y(4)^2)*(sin(2*y(1)))*((1/3)*Mb*Lb^2)+g*(sin(y(1)))*(Mb*(Lb/2)))/((1/3)*Mb*Lb^2);
yprima(3)=y(4);
yprima(4)=(-(y(4)^2)*(sin(2*y(1)))*((1/3)*Mb*Lb^2))/(((sin(y(1)))^2)*(1/3)*Mb*Lb^2);
yprima(5)=y(5);
%yprima(6)=;

yprima=yprima';

end

