% limpar
clear; clc; close all;
% carrega o pacote de imagens
pkg load image;

% 1. a
% carrega a imagem
image = im2double(imread('building_original.tif'));

% 1. b
maskAverage = fspecial('average', 5);
filteredImageAverage = imfilter(image, maskAverage);

figure, imshow(filteredImageAverage), title('Imagem filtro da media');

sobelX = [-1 -2 -1; 0 0 0; 1 2 1];
sobelY = [-1 0 1; -2 0 2; -1 0 1];

gXAverage = imfilter(filteredImageAverage, sobelX);
gYAverage = imfilter(filteredImageAverage, sobelY);

figure, imshow(abs(gXAverage)), title('g(x)');
figure, imshow(abs(gYAverage)), title('g(y)');

gradienteAverage = abs(gXAverage) + abs(gYAverage);

figure, imshow(gradienteAverage), title('Gradiente com imagem filtrada');

% 1. c

gX = imfilter(image, sobelX);
gY = imfilter(image, sobelY);

figure(1), subplot(1,2,1), imshow(abs(gX)), title('g(x)');
figure(1), subplot(1,2,2), imshow(abs(gY)), title('g(y)');

gradiente = abs(gX) + abs(gY);

figure, imshow(gradiente), title('Gradiente');

limiar1 = max(gradiente(:)) * 0.33;

gradienteLimiar = false(size(gradiente));

gradienteLimiar(gradiente >= limiar1) = true;

figure, imshow(gradienteLimiar), title('Gradiente com limiar 33%');

limiar2 = max(gradienteAverage(:)) * 0.33;

gradienteAverageLimiar = false(size(gradienteAverage));

gradienteAverageLimiar(gradienteAverage >= limiar2) = true;

figure, imshow(gradienteAverageLimiar), title('Gradiente com filtro e com limiar 33%');

% 2. a

image2 = im2double(imread('headCT-Vandy.png'));

% imagem a
figure, imshow(image2), title('Imagem a');

maskAverage = fspecial('average', 5);
filteredImage = imfilter(image2, maskAverage);

sobelX = [-1 -2 -1; 0 0 0; 1 2 1];
sobelY = [-1 0 1; -2 0 2; -1 0 1];

gX = imfilter(filteredImage, sobelX);
gY = imfilter(filteredImage, sobelY);

gradiente = abs(gX) + abs(gY);

limiar = max(gradiente(:)) * 0.15;

gradienteLimiar = false(size(gradiente));

gradienteLimiar(gradiente >= limiar) = true;

% imagem b
figure, imshow(gradienteLimiar), title('Gradiente com limiar 15%');

[laplacianoGaussiana, thresh] = edge(image2, "LoG");

%imagem c
figure, imshow(laplacianoGaussiana), title('Marr-Hildreth');

[canny, thresh] = edge(image2, "Canny", [0.05 0.15], 2);
figure, imshow(canny), title('Canny');