%{
Este programa ejecuta las funciones "Ragazzini.m y escoge_polos.m", para
encontrar el controlador adecuado.
 El programa solo lee funciones de trasferencia DISCRETAS. si tiene una
funcion continua utilize la funcion de matlab c2d(num,den,t).
Solo lee funciones de orden 2, 3 o 4. si desea otro orden, cree tal funcion
dentro del programa "Ragazzini.m"
Reemplaze los vectores "n" con el númerador, "d" con el denominador de su función 
de transferencia y el vector "pd" con los polos que desee. Para ello debe tener 
encuenta que si su función es de orden 3, debe ingresar 3 datos en el vector "pd".
En el archivo tfs.slx podra observar el diagrama de bloques en simulink
para un escalón unitario.
referencia: http://www.control-class.com/Tema_6/Slides/Tema_6_Diseno_Controladores.pdf
%}
clc;clear all;close all;
n=[0.01584 -0.03175 0.01594]; %%numerador de su función de transferencia
d=[1 -2.638 2.284 -0.6455]; %%denominador de su función de transferencia
pd=[0.5 0.5 0.5];%%POLOS DESEADOS
ERP=0; %%error en regimen permanente
T=0.005;%%tiempo de muestreo
[Controlador]=Ragazzini(n,d,ERP,T,pd);
