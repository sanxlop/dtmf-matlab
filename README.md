# Quiz

Proyecto DTMF en Matlab UPM ETSIT para la asignatura de Tratamiento Digital de Señales (TDSÑ)

### Autores:
	- Alberto Sánchez López          

### Definición:      
Este programa desarrollado en Matlab consiste en un detector DTMF. El programa aplica el algoritmo de Goertzel a los archivos de audio muestreados denominados como TONOS_XX.m y obtiene como resultado la energía espectral en el tiempo a cada una de las frecuencias. Por último compara donde se producen dos picos de energía espectral de dos frecuencias e indica la tecla que se a pulsado en el tiempo gráficamente.

El fichero a ejecutar en Matlab es el "busca.m" que se apoya en "compara.m" encargado de aplicar los umbrales para detectar la tecla pulsada y en "goertzel.m" encargado de aplicar el algoritmo.

### Anexo:
Tambien se incluye un programa "filtrofab.m" que filtra el archivo de audio paso banda para eliminar ruidos innecesarios.

### Memoria e Instrucciones:
En la carpeta de Memoria e Instrucciones está explicado el modo de funcionamiento junto con imagenes de los resultados que se obtienen ademas de una breve presentación.
