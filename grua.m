function yprima = grua(t,y) 
Lb=10; % largo brazo
Mb=2000; % masa brazo
g=9.81;

Lf=5;
Mf=600;

M=1000;


yprima(1)=y(2); %velocidad en elevacion (alfa)
yprima(2)=  (190000 -1.5*y(2)^2*(Lb-y(5)+Lf)    + ((1/2)*(y(4)^2)*sin(2*y(1))*(((1/3)*Mb*Lb^2)+ (Mf*(Lb-y(5)+(Lf/2))^2)+(M*(Lb-y(5)+Lf)^2))) +      (g*sin(y(1))*((Mb*(Lb/2))+(Mf*(Lb-y(5)+(Lf/2))+(M*(Lb-y(5)+Lf)))))   -     (y(2)*(-2*Mf*(Lb-y(5)+(Lf/2))*y(6)-2*M*y(6)))  )  /    (((1/3)*Mb*Lb^2)+    ((1/12)*Mf*Lf^2) + (Mf*(Lb-y(5)+(Lf/2))^2)+ (M*(Lb-y(5)+Lf)^2));
yprima(3)=y(4);
yprima(4)=( 10000 -1.5*y(4)^2*(Lb-y(5)+Lf) -(y(4))*(sin(y(1))^2)*(-2*Mf*(Lb-y(5)+(Lf/2))*y(6)-2*M*y(6))-y(4)*sin(2*y(1))*y(2)*((1/3)*Mb*(Lb^2)+(1/12)*Mf*(Lf^2)+Mf*(Lb-y(5)+(Lf/2))^2+M*(Lb-y(5)+Lf)^2))/((sin(y(1))^2)*((1/3)*Mb*(Lb^2)+(1/12)*Mf*(Lf^2)+Mf*(Lb-y(5)+(Lf/2))^2+M*(Lb-y(5)+Lf)^2));

yprima(5)=y(6);
yprima(6)=( 1000 - 17*y(6)^2   +(1/2)*((y(2)^2)+(y(4)^2)*(sin(y(1))^2))*(-2*Mf*(Lb-y(5)+(Lf/2))*y(6)-2*M*y(6))-g*cos(y(1))*(-Mf*y(6)-M*y(6)))/(Mf+M);

yprima=yprima';

end

