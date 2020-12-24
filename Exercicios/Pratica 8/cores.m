% limpar
clear; clc; close all;
% carrega o pacote de imagens
pkg load image;

% carrega a imagem
IMG = imread('lena512.bmp');

size(IMG);
% vai retornar 3 valores largura, altura e quantidade de canais
% cada canal corresponde a um do componente dessa imagem no modelo de cores RGB.

figure, imshow(IMG), title('RGB Original');

R = IMG(:,:,1);
G = IMG(:,:,2);
B = IMG(:,:,3);

figure(1), subplot(1,3,1), imshow(R), title('Componente R');
figure(1), subplot(1,3,2), imshow(G), title('Componente G');
figure(1), subplot(1,3,3), imshow(B), title('Componente B');
% fica em tons de cinza por que como elas só tem um canal, 
% se tornaram imagens monocromáticas

HSI = rgb2hsi(IMG);

H = HSI(:,:,1);
S = HSI(:,:,2);
I = HSI(:,:,3);

figure(1), subplot(1,3,1), imshow(H), title('Componente H');
figure(1), subplot(1,3,2), imshow(S), title('Componente S');
figure(1), subplot(1,3,3), imshow(I), title('Componente I');

RGB = hsi2rgb(HSI);
figure, imshow(RGB), title('RGB');
