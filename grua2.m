function yprima = grua2(t,y,t_alfa,t_beta,f_flecha) 
Lb=10; % largo brazo
Mb=2000; % masa brazo
g=9.81;

Mf=600;

M=1000;

% ORIGINAL OPERATIVOOO
yprima(1)=y(2); %velocidad en elevacion (alfa)
yprima(2)= (-t_alfa+ 1.5*(y(2))^2*(y(5)+Lb) + ((y(4))^2)*sin(y(1))*cos(y(1))*(((1/3)*Mb*Lb^2) + ((1/12)*Mf*(y(5))^2) + (Mf*((y(5)/2)+Lb)^2) + (M*(y(5)+Lb)^2)) + g*sin(y(1))*((Mb*(Lb/2))+ Mf*((y(5)/2)+Lb)+M*(y(5)+Lb))-y(2)*   (((1/6)*Mf*y(5)*y(6)) + (2*Mf*((y(5)/2)+Lb)*(y(6)/2))+(2*M*(y(5)+Lb)*y(6))))         /   (((1/3)*Mb*Lb^2)+((1/12)*Mf*(y(5)^2))+(Mf*((y(5)/2)+Lb)^2)+M*(y(5)+Lb)^2)                                            ;
yprima(3)=y(4);
yprima(4)= ( -t_beta + 1.5*(y(4))^2*(y(5)+Lb)    -     ((y(4)^2)*2*sin(y(1))*cos(y(1))) * (((1/3)*Mb*Lb^2) + ((1/12)*Mf*y(5)^2)   + (Mf*((y(5)/2)+Lb)^2) + (M*(y(5)+Lb)^2))   -  (y(4)*((sin(y(1))^2))) * (((1/6)*Mf*y(5)*y(6)) + (2*Mf*((y(5)/2)+Lb)*y(6)) + 2*M*(y(5)+Lb)*y(6))                                                                                 ) / ((sin(y(1))^2)*(((1/3)*Mb*Lb^2)) + ((1/12)*Mf*(y(5))^2) + (Mf*((y(5)/2)+Lb)^2) + (M*(y(5)+Lb)^2))     ;
yprima(5)=y(6);
yprima(6)=( -f_flecha + 17*(y(6))^2 + (1/2)*((y(2)^2)+(y(4)^2)*sin(y(1))) * (((1/6)*Mf*y(5)) + (Mf*((y(5)/2)+Lb)) +(2*M*(y(5)+Lb)))                       -g*cos(y(1))*((1/2)*Mf+M)        ) / (Mf+M);



yprima=yprima';
end


% ORIGINAL OPERATIVOOO
% yprima(1)=y(2); %velocidad en elevacion (alfa)
% yprima(2)= (-0+ 1.5*(y(2))^2*(y(5)+Lb) + ((y(4))^2)*sin(y(1))*cos(y(1))*(((1/3)*Mb*Lb^2) + ((1/12)*Mf*(y(5))^2) + (Mf*((y(5)/2)+Lb)^2) + (M*(y(5)+Lb)^2)) + g*sin(y(1))*((Mb*(Lb/2))+ Mf*((y(5)/2)+Lb)+M*(y(5)+Lb))-y(2)*   (((1/6)*Mf*y(5)*y(6)) + (2*Mf*((y(5)/2)+Lb)*(y(6)/2))+(2*M*(y(5)+Lb)*y(6))))         /   (((1/3)*Mb*Lb^2)+((1/12)*Mf*(y(5)^2))+(Mf*((y(5)/2)+Lb)^2)+M*(y(5)+Lb)^2)                                            ;
% yprima(3)=y(4);
% yprima(4)= ( -10000 + 1.5*(y(4))^2*(y(5)+Lb)    -     ((y(4)^2)*2*sin(y(1))*cos(y(1))) * (((1/3)*Mb*Lb^2) + ((1/12)*Mf*y(5)^2)   + (Mf*((y(5)/2)+Lb)^2) + (M*(y(5)+Lb)^2))   -  (y(4)*((sin(y(1))^2))) * (((1/6)*Mf*y(5)*y(6)) + (2*Mf*((y(5)/2)+Lb)*y(6)) + 2*M*(y(5)+Lb)*y(6))                                                                                 ) / ((sin(y(1))^2)*(((1/3)*Mb*Lb^2) + ((1/12)*Mf*(y(5))^2) + (Mf*((y(5)/2)+Lb)^2) + (M*(y(5)+Lb)^2)))     ;
% yprima(5)=y(6);
% yprima(6)=( -1000 + 17*(y(6))^2 + (1/2)*((y(2)^2)+(y(4)^2)*sin(y(1))) * (((1/6)*Mf*y(5)) + (Mf*((y(5)/2)+Lb)) +(2*M*(y(5)+Lb)))                       -g*cos(y(1))*((1/2)*Mf+M)        ) / (Mf+M);
