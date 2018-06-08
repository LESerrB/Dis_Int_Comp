close all                                              % CIERRA VENTANAS ANTERIORES
delete(instrfind({'Port'},{'COM3'}));                  % CAMBIAR PUERTO SERIE DE ARDUINO
s=serial('COM3','BaudRate',9600,'Terminator','CR/LF'); % CREAR OBJETO SERIE
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
fopen(s);                                              % ABRIR PUERTO
%% PARAMETROS DE MEDIDAS
tmax=50;                                               % TIEMPO DE CAPTURA [s]
rate=5;
%% PREPARAR LA GRAFICA EN TIEMPO REAL
f = figure('Name','Captura');
a = axes('XLim',[0 50],'YLim',[0 5.0]);
l1 = line(nan,nan,'Color','k','LineWidth',2);

xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Captura de Senal Analogica')
grid on
%% INICIALIZA CAPTURA DE DATOS
v1 = zeros(1,tmax*rate);                               % VARIABLES DE ENTRADA
i = 1;
t = 0;

tic
while t<=tmax
    t = toc;
    a = fscanf(s,'%f');                                % LEER DEL PUERTO SERIE
    v1(i)=a(1)*5/1024;
    x = linspace(0,i/rate,i);                          % DIBUJAR EN LA FIGURA
    set(l1,'YData',v1(1:i),'XData',x);
    drawnow
    
    i = i+1;
end

clc;
fprintf('%g s de captura a %g cap/s \n',t,i/t);
%% GUARDADO DE DATOS
file = 'D:\Tarea 7 Interfaces\data.xlsx';
xlswrite(file,v1);
%% CIERRA PUERTO SERIE
fclose(s);
delete(s);
clear s;