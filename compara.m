%%%%%%%%%%%%%%%%%%%  Funcion que se encarga de deducir los
%%%%% COMPARA %%%%%  valores de los digitos pulsados a partir
%%%%%%%%%%%%%%%%%%%  de las señales obtenidas tras el Goertzel

function x=compara(senal, puntos)

n1=length(senal); %longitud de la señal original
ntoma102=floor(n1/102); %numero muestras señal / 102 

%señal tras goertzel a cada frecuencia
sf1=abs(goertzel(senal, 697, puntos));
sf2=abs(goertzel(senal, 770, puntos));
sf3=abs(goertzel(senal, 852, puntos));
sf4=abs(goertzel(senal, 941, puntos));

fa1=abs(goertzel(senal, 1209, puntos));
fa2=abs(goertzel(senal, 1336, puntos));
fa3=abs(goertzel(senal, 1477, puntos));

umbral=155000;  %155000 valor limite para que no se produzcan errores

D=(1:ntoma102); %matriz con digitos

%bucle en el que se comparan si los valores de energía
%superan el umbral establecido, si se cumple para ambas frecuencias
%se añadira el valor del digito equivalente
for j=1:ntoma102 
    D(j)=0; %si no se cumple para ninguno = 0
    if  (sf1(j)>umbral && fa1(j)>umbral)  
        D(j)=1;
    end
    if (sf1(j)>umbral && fa2(j)>umbral) 
        D(j)=2;
    end
    if (sf1(j)>umbral && fa3(j)>umbral)
        D(j)=3;
    end
    %%%%%%%%%%%%%%%%%%%%
    if  (sf2(j)>umbral && fa1(j)>umbral)
        D(j)=4;
    end
    if (sf2(j)>umbral && fa2(j)>umbral)
        D(j)=5;
    end
    if (sf2(j)>umbral && fa3(j)>umbral)
        D(j)=6;
    end
    %%%%%%%%%%%%%%%%%%%%%
    if  (sf3(j)>umbral && fa1(j)>umbral)
        D(j)=7;
    end
    if (sf3(j)>umbral && fa2(j)>umbral)
        D(j)=8;
    end
    if (sf3(j)>umbral && fa3(j)>umbral)
        D(j)=9;
    end
    %%%%%%%%%%%%%%%%%%%%
    if  (sf4(j)>umbral && fa1(j)>umbral)
        D(j)=10; %el 10 se refiere al *
    end
    if (sf4(j)>umbral && fa2(j)>umbral)
        D(j)=11; %el 11 se refiere al 0
    end
    if (sf4(j)>umbral && fa3(j)>umbral)
        D(j)=12; %el 12 se refiere a la #
    end
end
    
x=D;