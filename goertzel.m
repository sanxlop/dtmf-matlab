%%%%%%%%%%%%%%%%%%%%  Funcion que simula el flujograma del 
%%%%% GOERTZEL %%%%%  algoritmo de Goertzel
%%%%%%%%%%%%%%%%%%%%  

function x = goertzel(senal, fevaluada, puntos)

fmuestreo = 8000; %dato
n1 = length(senal); %longitud de la señal original
ntoma102 = floor(n1/102); %numero muestras señal / 102 
%enteros más próximos a menores o iguales a A.
m = 0; 
N = puntos; %numero de puntos DFT (numero total de muestras)
yk = (1:ntoma102); %dimension matriz

%datos para calculos
k = round(fevaluada*N/fmuestreo); %el késimo término de la DTF 
theta = 2*pi*k/N;
WkN = exp(-theta*sqrt(-1));

for j=1:ntoma102 ; 
       %iniciamos las condiciones iniciales
       M1=0;
       M2=0;
          
       %parte recursiva
       for n=1:102 ;      
          %cuando n=102+m, tomamos A para la parte no recursiva
          A=senal(n+m)+2*cos(theta)*M1-M2;
          M2=M1;
          M1=A;
       end
    
    %parte no recursiva
    m=m+102 ;
    yk(j)= (A-M1*WkN);  
    
end
   
   x = yk;