% CAIDA LIBRE DEL PENDULO
clear
%F=0; % fuerza externa en cero
%rho_a=0; % coeficiente roce con el aire
y0=[10*pi/180 0 0]; % condiciones iniciales
dt=0.01;  % periodo del sistema
k=1;
tmax=20.0;  % tiempo maximo de la simulacion

% inicializacion variables de salida
yt=zeros(fix(tmax/dt)+1,3);
tt=zeros(fix(tmax/dt)+1,1);

for t1=0:dt:tmax
    % integrador numerico
    [t,y]=ode23(@(t,y) grua(t,y),[t1 t1+dt],y0);
    
    % toma ultimo valor del vector
    yt(k,:)=y(max(size(y)),:);
    
    % usa valor entre 0 y 2pi
    if yt(k,1)<0, yt(k,1)=yt(k,1)+2*pi; end;
    if yt(k,1)>2*pi, yt(k,1)=yt(k,1)-2*pi; end;
    
    % toma ultimo valor tiempo simulado
    tt(k,:)=t(max(size(y)));
    
    % guarda valor de variables para inicio periodo siguiente
    y0=yt(k,:);
    
    % incrementa periodo
    k=k+1;
end

% dibuja respuesta de angulo
plot(tt,yt(:,1)*180/pi); xlabel('tiempo, segs'); ylabel('Alfa, grados'); %pause

