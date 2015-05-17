%%%%%%%%%%%%%%%%%  Se encarga de imprimir por pantalla las señales
%%%%% BUSCA %%%%%  tras pasar por el goertzel y los digitos de la 
%%%%%%%%%%%%%%%%%  funcion compara

clear
clc

TONOS_01 %cargamos el archivo

senal = dtmf; %yf (seria con el filtrado)

N = 102; %numero de puntos DFT (orden)
duracion = length(dtmf)/8000; %en segundos

fbuscada=697;
amplitud=abs(goertzel(senal, fbuscada, N));
figure(1)
subplot(2,4,1) 
stem(amplitud, 'r')
ylabel('Energía')
xlabel('n')
title('697 (Hz)')

fbuscada=770;
amplitud=abs(goertzel(senal, fbuscada, N));
subplot(2,4,2)
stem(amplitud, 'r')
ylabel('Energía')
xlabel('n')
title('770 (Hz)')

fbuscada=852;
amplitud=abs(goertzel(senal, fbuscada, N));
subplot(2,4,3) 
stem(amplitud, 'r')
ylabel('Energía')
xlabel('n')
title('852 (Hz)')

fbuscada=941;
amplitud=abs(goertzel(senal, fbuscada, N));
subplot(2,4,4) 
stem(amplitud, 'r')
ylabel('Energía')
xlabel('n')
title('941 (Hz)')

fbuscada=1209;
amplitud=abs(goertzel(senal, fbuscada, N));
subplot(2,4,5)
stem(amplitud)
ylabel('Energía')
xlabel('n')
title('1209 (Hz)')

fbuscada=1336;
amplitud=abs(goertzel(senal, fbuscada, N));
subplot(2,4,6)
stem(amplitud)
ylabel('Energía')
xlabel('n')
title('1336 (Hz)')

fbuscada=1477;
amplitud=abs(goertzel(senal, fbuscada, N));
subplot(2,4,7)
stem(amplitud)
ylabel('Energía')
xlabel('n')
title('1477 (Hz)')

%fbuscada=1633;
%amplitud=abs(goertzel(senal, fbuscada, N));
%subplot(2,4,8)
%stem(amplitud)
%xlabel('n')
%title('1633 (Hz)')

 datosComp=compara(senal, N);
 subplot(2,4,8)
 plot(datosComp, 'k*')
 grid
 ylabel('Tecla')
 xlabel('n')
 title('TECLAS PULSADAS')