% limpar
clear; clc; close all;
% carrega pacote de imagens
pkg load image;
% carregar imagem
I = imread("noisy_fingerprint2.tif");

% definir elementos estruturantes
square = strel('square', 3);
% aplicar operação de erosão
E = imerode(I,square);
% aplicar operações de abertura
OP = imopen(I,square);
% aplicar operações de dilatação da abertura
D = imdilate(OP,square);
% aplicar operações de fechamento da abertura
C = imclose(OP,square);
% exibir imagens
figure, imshow(I), title('Imagem Original');
figure(1), subplot(2,2,1), imshow(E), title('Erosão: quadrado 3x3');
figure(1), subplot(2,2,2), imshow(OP), title('Abertura: quadrado');
figure(1), subplot(2,2,3), imshow(D), title('Dilatação da Abert.: quadrado 3x3');
figure(1), subplot(2,2,4), imshow(C), title('Fechamento da Abert.: quadrado 3x3');