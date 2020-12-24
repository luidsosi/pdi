% limpar
clear; clc; close all;
% carrega pacote de imagens
pkg load image;
% carregar imagem
I = imread("wirebond-mask.tif");

% definir elementos estruturantes
square1 = strel('square',11);
square2 = strel('square',15);
square3 = strel('square',45);
% aplicar operação de erosão
S1 = imerode(I,square1);
S2 = imerode(I,square2);
S3 = imerode(I,square3);
% exibir imagens
figure, imshow(I), title('Objetos');
figure, imshow(S1), title('Erosao: quadrado 11x11');
figure, imshow(S2), title('Erosao: quadrado 15x15');
figure, imshow(S3), title('Erosao: quadrado 45x45');