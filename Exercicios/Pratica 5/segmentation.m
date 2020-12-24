% limpar
clear; clc; close all;
% carrega o pacote de imagens
pkg load image;

% carrega a imagem
image = im2double(imread('wirebond_mask.png'));

figure, imshow(image), title('Imagem Original');

% exemplo 10.2
maskLaplaciano = [1 1 1; 1 -8 1; 1 1 1];

laplaciano = imfilter(image, maskLaplaciano);

figure, imshow(laplaciano, []), title('Imagem do Laplaciano');

absLaplaciano = abs(laplaciano);

figure, imshow(absLaplaciano), title('Imagem do absoluto do Laplaciano');

percentage = 0.4;
limiar = max(absLaplaciano(:)) * percentage;

laplaciano2 = true(size(laplaciano));

laplaciano2(absLaplaciano <= limiar) = false;

figure, imshow(laplaciano2), title('Imagem dos valores positivos do Laplaciano');

% exemplo 10.3

maskLaplaciano45 = [2 -1 -1; -1 2 -1; -1 -1 2];

laplaciano = imfilter(image, maskLaplaciano45);

figure, imshow(laplaciano, []), title('Imagem do Laplaciano');

laplaciano2 = laplaciano;
laplaciano2(laplaciano < 0) = 0;

figure, imshow(laplaciano2), title('Imagem do Laplaciano com valores negativos zerados');

limiar = max(laplaciano2(:));

laplaciano3 = false(size(laplaciano));

laplaciano3(laplaciano2 >= limiar) = true;

figure, imshow(laplaciano3);