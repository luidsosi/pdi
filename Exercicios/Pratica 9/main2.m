% limpar
clear; clc; close all;
% carrega pacote de imagens
pkg load image;
% carregar imagem
I = imread("noisy_fingerprint2.tif");

% definir elementos estruturantes
square = strel('square', 3);
% aplicar opera��o de eros�o
E = imerode(I,square);
% aplicar opera��es de abertura
OP = imopen(I,square);
% aplicar opera��es de dilata��o da abertura
D = imdilate(OP,square);
% aplicar opera��es de fechamento da abertura
C = imclose(OP,square);
% exibir imagens
figure, imshow(I), title('Imagem Original');
figure(1), subplot(2,2,1), imshow(E), title('Eros�o: quadrado 3x3');
figure(1), subplot(2,2,2), imshow(OP), title('Abertura: quadrado');
figure(1), subplot(2,2,3), imshow(D), title('Dilata��o da Abert.: quadrado 3x3');
figure(1), subplot(2,2,4), imshow(C), title('Fechamento da Abert.: quadrado 3x3');