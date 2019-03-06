%{
Esta función calcula un controlador por el método de Ragazzini-Truxal, 
para una función de transferencia DISCRETA de orden 2, 3 o 4.
Utiliza la función "escoge_polos.m" para su funcionamiento.
By. Cristian Malaver
%}
function[C]=Ragazzini(num,den,ERP,td,pd)
%Gs=tf(numS,denS);
%Gz=c2d(Gs,td)
Gz=tf(num,den,td)
%%I=(tf([1],[1 0],0.005));
%Gz=Gz*I;
Gzr=feedback(Gz,1);
step(Gz)
den=Gz.Denominator{1};
num=Gz.Numerator{1};
hold on
if length(den)==4 %%orden 3
%%___POLOS DESEADOS_______
pd0=pd(1,1);
pd1=pd(1,2);
pd2=pd(1,3);
z=roots(den)
z1=z(1,1);
z2=z(2,1);
z3=z(3,1);
pin=escoge_polos(z)  %%<<----------------POLO INESTABLE
A=[pin 1;1 1];
f0=(pin-pd0)*(pin-pd1)*(pin-pd2);
f1=(1-ERP)*(1-pd0)*(1-pd1)*(1-pd2);
b=[f0 f1]';
cons=inv(A)*b;
b0=cons(1,1)
b1=cons(2,1)
denGd=conv([1 -pd0],conv([1 -pd1],[1 -pd2]));
Nd=[0 0 b0 b1];
Gdz=tf(Nd,denGd,td)
G=tf(den,num,td);
G1=tf(Nd,denGd-Nd,td);
C=G*G1
Fz=C*Gz;

Fzr=feedback(Fz,1);
step(Fzr)
end
if length(den)==5%%orden 4----------------------------------------------------------------------
 %%___POLOS DESEADOS_______
pd0=pd(1,1);
pd1=pd(1,2);
pd2=pd(1,3);
pd3=pd(1,4);
%%________________________
z=roots(den)
z1=z(1,1);
z2=z(2,1);
z3=z(3,1);
z4=z(4,1);
pin=escoge_polos(z)  %%<<----------------POLO INESTABLE
A=[pin 1;1 1];
f0=(pin-pd0)*(pin-pd1)*(pin-pd2)*(pin-pd3);
f1=(1-ERP)*(1-pd0)*(1-pd1)*(1-pd2)*(1-pd3);
b=[f0 f1]';
cons=inv(A)*b;
b0=cons(1,1);
b1=cons(2,1);
denGd=conv([1 -pd0],conv([1 -pd1],conv([1 -pd2],[1 -pd3])));
Nd=[0 0 0 b0 b1];
Gdz=tf(Nd,denGd,td);
G=tf(den,num,td);
G1=tf(Nd,denGd-Nd,td);
C=G*G1
Fz=C*Gz;
Fzr=feedback(Fz,1);
step(Fzr)
end
if length(den)==3 %%orden 2____________________________________________
%%___POLOS DESEADOS_______
pd0=pd(1,1);
pd1=pd(1,2);
z=roots(den)
z1=z(1,1);
z2=z(2,1);
pin=escoge_polos(z) %%<<----------------POLO INESTABLE
A=[pin 1;1 1];
f0=(pin-pd0)*(pin-pd1);
f1=(1-ERP)*(1-pd0)*(1-pd1);
b=[f0 f1]';
cons=inv(A)*b;
b0=cons(1,1);
b1=cons(2,1);
denGd=conv([1 -pd0],[1 -pd1]);
Nd=[0 b0 b1];
Gdz=tf(Nd,denGd,td);
G=tf(den,num,td);
G1=tf(Nd,denGd-Nd,td);
C=G*G1
Fz=C*Gz;

Fzr=feedback(Fz,1);
step(Fzr)
end
