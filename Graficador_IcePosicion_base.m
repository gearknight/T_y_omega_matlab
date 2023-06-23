%Establece en primer lugar los límites apa el gráfico de indice de posicion
hold on
xticks(5:5:100)
yticks(0:5:40)
axis([20 100 0 40])
xlabel("Humedad relativa [%]")
ylabel("Temperatura [ºC]")
T_min= repmat(15, [1,10]);
T_max= repmat(25, [1,10]);
w_ite=10:10:100;
plot(w_ite,T_min,'r--')
plot(w_ite,T_max,'r--')
w_min= repmat(45, [1,21]);
w_max= repmat(65, [1,21]);
T_para_w= 0:2:40;
plot(w_min,T_para_w,'g--')
plot(w_max,T_para_w,'g--')
A= dlmread('H36bibliotecaPA.csv',",",[2 2 1112 4]);
title("H36bibliotecaPA.csv")

%Fun fact: no es necesario corregir cantidades, esta configuracion de Octave entiende que el separador decimal es el punto
Temperaturas_biblioteca= A(:,1);
ws_biblioteca=A(:,2);
plot(ws_biblioteca,Temperaturas_biblioteca, 'k*')

Numerador_Idce_Posicion=0;
for i=1:rows(Temperaturas_biblioteca)
if ((Temperaturas_biblioteca(i)>15)&&(Temperaturas_biblioteca(i)<25))&&((ws_biblioteca(i)>45)&&(ws_biblioteca(i)<65))
  Numerador_Idce_Posicion=Numerador_Idce_Posicion+1;
end
end
Indice_Posicion=Numerador_Idce_Posicion/rows(Temperaturas_biblioteca)
text(80,35, strcat("Indice de Posicion=  "," ", num2str(Indice_Posicion)))
hold off
