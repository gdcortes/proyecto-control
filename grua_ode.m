% CAIDA LIBRE GRUA
clear
%F=0; % fuerza externa en cero
rho_a=1; % coeficiente roce con el aire
y0=[10*pi/180 0 10*pi/180 0 0 0]; % condiciones iniciales
dt=0.1;  % periodo del sistema
k=1;
tmax=20;  % tiempo maximo de la simulacion (ojo con tiempo de simulacion para valores iniciales muy altos)

% inicializacion variables de salida
yt=zeros(fix(tmax/dt)+1,6);
tt=zeros(fix(tmax/dt)+1,1);

for t1=0:dt:tmax
    % integrador numerico
    [t,y]=ode23(@(t,y) grua(t,y),[t1 t1+dt],y0);
    
    % toma ultimo valor del vector
    yt(k,:)=y(max(size(y)),:);
    
    % usa valor entre 0 y 2pi
    if yt(k,1)<0, yt(k,1)=yt(k,1)+2*pi; end;
    if yt(k,1)>2*pi, yt(k,1)=yt(k,1)-2*pi; end;
    
   % if yt(k,3)<0, yt(k,3)=yt(k,3)+2*pi; end;
    %if yt(k,3)>2*pi, yt(k,3)=yt(k,3)-2*pi; end;
    
    % toma ultimo valor tiempo simulado
    tt(k,:)=t(max(size(y)));
    
    % guarda valor de variables para inicio periodo siguiente
    y0=yt(k,:);
    
    % incrementa periodo
    k=k+1;
end

% dibuja respuesta de angulo
plot(tt,yt(:,1)*180/pi); xlabel('tiempo, segs'); ylabel('Alfa, grados'); %pause

%plot(tt,yt(:,2)); xlabel('tiempo, segs'); ylabel('velocidad angular alfa');% pause
%plot(tt,yt(:,3)*180/pi); xlabel('tiempo, segs'); ylabel('Beta, grados'); %pause
