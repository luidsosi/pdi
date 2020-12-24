%limpar
clear; clc; close all;
%carrega pacote de imagem
pkg load image;

%carrega a imagem
image = imread('original_pattern.tif');
figure, imshow(image), title('Imagem Original');

%coloca ruido na imagem
noiseGaussian = imnoise(image, 'gaussian', 0, 0.1);
noiseSaltPepper = imnoise(image, 'salt & pepper', 0.05);

%mostra as imagens
figure, imshow(noiseGaussian), title('Imagem com ruido Gaussiano');
figure, imshow(noiseSaltPepper), title('Imagem com ruido Sal e Pimenta');

%mostra os histogramas das imagens
figure, imhist(noiseGaussian), title('Histograma da imagem com ruido Gaussiano');
figure, imhist(noiseSaltPepper), title('Histograma da imagem com ruido Sal e Pimenta');