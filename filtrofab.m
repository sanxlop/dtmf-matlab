%%%%%%%%%%%%%%%%%%%%%  Filtra la señal para dejar solo el rango
%%%%% FILTROFAB %%%%%  de frecuencias esperado. Primero suena 
%%%%%%%%%%%%%%%%%%%%%  la original y despues la filtrada

clear
clc

TONOS_01
fs=8000;
y=dtmf;
sound(y,fs) %señal original

%Filtro de frecuencias bajas
F1=[587 687 951 1051]; 
delta1=0.000576; % rizado 0.01 db en banda de paso; 
delta2=0.00001; % atenuacion de 100db 
dev=[delta2 delta1 delta2]; 
fs=8000; A=[0 1 0]; 
[n,Fo,Ao,w]=firpmord(F1,A,dev,fs); 
h1=firpm(n,Fo,Ao,w); 

%Filtro de frecuencias altas
F2=[1099 1199 1487 1587]; 
delta1=0.000576; % rizado 0.01 db en banda de paso; 
delta2=0.00001; % atenuacion de 100db 
dev=[delta2 delta1 delta2]; 
fs=8000; A=[0 1 0]; 
[n,Fo,Ao,w]=firpmord(F2,A,dev,fs); 
h2=firpm(n,Fo,Ao,w);

h=h1+h2; %suma de ambos filtros 
figure 
freqz(h,1,1001,8000) 
yf=filter(h,1,y); 
sound(yf,fs)  %señal filtrada





