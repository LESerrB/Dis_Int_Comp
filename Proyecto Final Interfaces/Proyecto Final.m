%% MUESTREO
close all                               % CIERRA VENTANAS ANTERIORES
clear
clc
file = 'C:\Users\leser\Dropbox\Tarea 7 Interfaces\data.xlsx';
v1 = xlsread(file, 'A1:IP1');
t = 0:0.0166667:250;
%% CODIFICACION
v2 = round(v1*16)/16;                   % 4 BITS
v3 = round(v1*256)/256;                 % 8 BITS
v4 = round(v1*65536)/65536;             % 16 BITS
v5 = round(v1*4294967296)/4294967296;   % 32 BITS
%% ERRORES NUMERICOS REPRESENTACION DIGITAL
E1 = 0;
E2 = 0;
E3 = 0;
E4 = 0;

for i=1:length(v1);				
	v9(i) = v2(i)-v1(i);                % ERROR NUMERICO 4 BITS
    E1 = E1+v9(i);
	v10(i) = v3(i)-v1(i);               % ERROR NUMERICO 8 BITS
    E2 = E2+v10(i);
	v11(i) = v4(i)-v1(i);               % ERROR NUMERICO 16 BITS
    E3 = E3+v11(i);
	v12(i) = v5(i)-v1(i);               % ERROR NUMERICO 32 BITS
    E4 = E4+v12(i);
end

E1 = E1/length(v9)*100;
E2 = E2/length(v10)*100;
E3 = E3/length(v11)*100;
E4 = E4/length(v12)*100;
%% DISTRIBUCION PROBABILISTICA
m_v2 = median(v2);
m_v3 = median(v3);
m_v4 = median(v4);
m_v5 = median(v5);

DP1 = normpdf(v2, m_v2);
DP2 = normpdf(v3, m_v3);
DP3 = normpdf(v4, m_v4);
DP4 = normpdf(v5, m_v5);
%% SNR
v6(1) = snr(v2);
v6(2) = snr(v3);
v6(3) = snr(v4);
v6(4) = snr(v5);
%% PCM NRZ
pnrz=ones(1,20);

xpcm_v2 = dec2bin(v2)-48;                  % PCM 4 BITS
xpcm_v2 = xpcm_v2(:);
senpcm_v2=pnrz'*xpcm_v2';
senpcm_v2=senpcm_v2(:);

xpcm_v3 = dec2bin(v3)-48;                  % PCM 8 BITS                  
xpcm_v3 = xpcm_v3(:);
senpcm_v3=pnrz'*xpcm_v3';
senpcm_v3=senpcm_v3(:);
%% PRESENTACION GRAFICAS FINALES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Senal Analoga');
plot(v1,'k')
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
title('Senal Original')
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Cuantizacion');
%$$$$$$$$$$$$$$$ 4 BITS $$$$$$$$$$$$$$$
subplot(2,2,1)
plot(v1,'k')
hold on
stairs(v2,'r')
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
title('Senal Cuantificada 4 Bits')
axis('tight')
hold on
grid on
%$$$$$$$$$$$$$$$ 8 BITS $$$$$$$$$$$$$$$
subplot(2,2,2)
plot(v1,'k')
hold on
stairs(v3,'g')
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
title('Senal Cuantificada 8 Bits')
axis('tight')
grid on
%$$$$$$$$$$$$$$ 16 BITS $$$$$$$$$$$$$$$
subplot(2,2,3)
plot(v1,'k')
hold on
stairs(v4,'y')
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
title('Senal Cuantificada 16 Bits')
axis('tight')
grid on
%$$$$$$$$$$$$$$$ 32 BITS $$$$$$$$$$$$$$
subplot(2,2,4)
plot(v1,'k')
hold on
stairs(v5,'b')
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
title('Senal Cuantificada 32 Bits')
axis('tight')
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Distribucion Probabilistica')
%$$$$$$$$$$$$$$$ 4 BITS $$$$$$$$$$$$$$$
subplot(2,2,1)
plot(DP1,'r')
axis('tight')
grid on
%$$$$$$$$$$$$$$$ 8 BITS $$$$$$$$$$$$$$$
subplot(2,2,2)
plot(DP2,'g')
axis('tight')
grid on
%$$$$$$$$$$$$$$$ 16 BITS $$$$$$$$$$$$$$
subplot(2,2,3)
plot(DP3,'y')
axis('tight')
grid on
%$$$$$$$$$$$$$$$ 32 BITS $$$$$$$$$$$$$$
subplot(2,2,4)
plot(DP4,'b')
axis('tight')
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','SNR de las senales')
bar(v6)
ylabel('SNR [dB]')
title ('Relacion Senal a Ruido')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Senal PCM')
%$$$$$$$$$$$$$$$ 4 BITS $$$$$$$$$$$$$$$
subplot(2,1,1)
plot(t,senpcm_v2)
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
title('Senal PCM 4 Bits')
axis('tight')
grid on
%$$$$$$$$$$$$$$$ 8 BITS $$$$$$$$$$$$$$$
subplot(2,1,2)
plot(t,senpcm_v3)
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
title('Senal PCM 16 Bits')
axis('tight')
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Error de cuantificacion de 4 bits: \n %3.2f\n',E1)
fprintf('Error de cuantificacion de 8 bits: \n %3.2f\n',E2)
fprintf('Error de cuantificacion de 16 bits: \n %3.2f\n',E3)
fprintf('Error de cuantificacion de 32 bits: \n %3.2f\n',E4)