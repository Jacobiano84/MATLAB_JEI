clear, clc
X=linspace(0,16);
Y=(1/2)*sin(4*X/3)+2;
m=(2/3)*cos(4*X/3); %derivada de Y
mp=-1./m;

for k=1:length(X)
    axis([0 18 -1 8]);
    f=@(x) Y(k)+m(k)*(x-X(k)); %recta tangente a la curva
    g=@(x) Y(k)+mp(k)*(x-X(k)); %recta perpendicular
    
    %Centro C(h,K) y radio circunferencia
    h=(-sqrt(m(k)^2+1)+(m(k)-mp(k))*X(k))/(m(k)-mp(k)); 
    K=g(h);
    r=1;
    
    %Circunferencia
    x=linspace(h-r,h+r);
    y1=K+sqrt(abs(r^2-(x-h).^2));
    y2=K-sqrt(abs(r^2-(x-h).^2));
    
    fplot(@(x)(1/2)*sin(4*x/3)+2)
    hold on
    fplot(f,":")
    fplot(g,":")
    plot(x,y1,'r',x,y2,'r')
    axis([0 16 -1 8]);
    pause(0.05)
    clf
end
fplot(@(x)(1/2)*sin(4*x/3)+2)
hold on
fplot(f,":")
fplot(g,":")
plot(x,y1,'r',x,y2,'r')
axis([0 18 -1 8]);
disp('¡Animación realizada!')