% %%%%%%%%%%%%%%%%%%% GRUA LAZO ABIERTO %%%%%%%%%%%%%%%%%
clear


y0=[ (pi/3) -1 (pi/3) 1 5 1]; % condiciones iniciales
dt=0.1;  % periodo del sistema
k=1;
tmax=8;  % tiempo maximo de la simulacion (ojo con tiempo de simulacion para valores iniciales muy altos)

% inicializacion variables de salida
yt=zeros(fix(tmax/dt)+1,6);
tt=zeros(fix(tmax/dt)+1,1);



for t1=0:dt:tmax
    % integrador numerico
    
    if t1<2
        t_alfa=190000;
        t_beta=10000;
        f_flecha=1000;
    end
    if t1>=2
        t_alfa=0;
        t_beta=10000;
        f_flecha=1000;
    end
   
    
    [t,y]=ode23(@(t,y) grua2(t,y,t_alfa,t_beta,f_flecha),[t1 t1+dt],y0);
    
    % toma ultimo valor del vector
    yt(k,:)=y(max(size(y)),:);
    
    % usa valor entre 0 y 2pi para el beta
    if yt(k,3)<0, yt(k,3)=yt(k,3)+2*pi; end
    if yt(k,3)>2*pi, yt(k,3)=yt(k,3)-2*pi; end
    
    
    if yt(k,1)>pi/2
        yt(k,1)=pi/2;
        yt(k,2)=0;
    end
    %if yt(k,1)>pi/2, yt(k,2)=0;end;
    
    if yt(k,1)<0.1 
        yt(k,1)=0.1;
        yt(k,2)=0;
    end
    
    %if yt(k,1)<0, yt(k,2)=0;end;
    
    if yt(k,5)>80  %si la longitud de la flecha es mayor a 50 respecto al final del brazo (es decir la flecha mide maximo 50)
        yt(k,5)=80;
        yt(k,6)=0; 
    end
    
     if yt(k,5)<0  %si la longitud de la flecha es mayor a 85 respecto al final del brazo (es decir la flecha mide maximo 85)
        yt(k,5)=0;
        yt(k,6)=0; 
    end
    
    
    if yt(k,6)>24   %velocidad maxima de translacion de la flecha es 24 m/s (aprox 85km/h)
        yt(k,6)=24;
    end
    
   
   
    % toma ultimo valor tiempo simulado
    tt(k,:)=t(max(size(y)));
    
    % guarda valor de variables para inicio periodo siguiente
    y0=yt(k,:);
    
    % incrementa periodo
    k=k+1;
end




figure(1)
subplot(3,1,1)
% dibuja respuesta de angulo
plot(tt,yt(:,1)*180/pi); xlabel('tiempo, segs'); ylabel('Alfa, grados'); 
subplot(3,1,2)
plot(tt,yt(:,3)*180/pi); xlabel('tiempo, segs'); ylabel('Beta, grados'); 


subplot(3,1,3)
plot(tt,yt(:,5)); xlabel('tiempo, segs'); ylabel('Largo flecha, metros');

figure(2)

subplot(3,1,1)
plot(tt,yt(:,2)*180/pi); xlabel('tiempo, segs'); ylabel('Velocidad alfa');
subplot(3,1,2)

plot(tt,yt(:,4)*180/pi); xlabel('tiempo, segs'); ylabel('Velocidad beta'); 

 subplot(3,1,3)

plot(tt,yt(:,6)); xlabel('tiempo, segs'); ylabel('Velocidad flecha'); 

