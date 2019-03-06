function[pin]=escoge_polos(z)
%{
Esta Función elige el polo que sea inestable con la siguiente logica:
1. escoge el polo que sea real mayor
2. si no existen polos reales, saca la magnitud de los polos imaginarios y
de igual manera elige el mayor.
By. Cristian Malaver
%}
tam=length(z); 
R=0;
I=0;
g=0;
for i=1:tam
    q=isreal(z(i,1));
    if q==1
        R=horzcat(R,z(i,1));
    end    
    if q==0 
        I=horzcat(I,abs(z(i,1)));
    end
end
if length(R)>1
            for j=1:length(R)
                if R(1,j)>g
                    g=R(1,j);
                end
            end
else
    if length(I)>1
        for j=1:length(I)
                if I(1,j)>g
                    g=I(1,j);
                end
        end
    end
end
        pin=g;
R;
I;