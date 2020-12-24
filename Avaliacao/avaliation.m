clear; clc; close all;
pkg load image;

%Questao 8
IMAGE = imread('ckt-board-saltpep-prob.pt05.tif');
figure, imshow(IMAGE), title('Imagem Original- Com Ruido Sal e Pimenta');

maskAverage5 = fspecial('average', 5);

filteredImageAverage5 = imfilter(IMAGE, maskAverage5);
filteredImageMedian5 = medfilt2(IMAGE, [5 5]);

figure, imshow(filteredImageAverage5), title('Imagem Filtrada- Media 5x5');
figure, imshow(filteredImageMedian5), title('Imagem Filtrada- Mediana 5x5');

%Questao 2
IMAGE1 = imread('figura_1a.png');
IMAGE2 = imread('figura_1b.png');
figure, imshow(IMAGE1), title('Figura 1a');
figure, imshow(IMAGE2), title('Figura 1b');
AND = IMAGE1 & IMAGE2;
figure, imshow(AND), title('Figura 1a AND Figura 1b');
OR = IMAGE1 | IMAGE2;
figure, imshow(OR), title('Figura 1a OR Figura 1b');
NOT = ~AND;
figure, imshow(NOT), title('NOT (Figura 1a AND Figura 1b)');

%Questao 7

H = imread('figura_2a.png');
I = imread('figura_2b.png');
% Mostrar imagens originais
figure, imshow(H), title('Figura 2a');
figure, imshow(I), title('Figura 2b');
% Mostar histógramas das imagens originais
figure, imhist(H), title('Histograma da imagem 2a - antes da convolucao');
figure, imhist(I), title('Histograma da imagem 2b - antes da convolucao');
% Filtro suavização
F = fspecial('average',3);
HF= imfilter(H,F);
IF = imfilter(I,F);

figure, imshow(HF), title('Figura 2a com filtro')
figure, imhist(HF), title('Histograma da imagem 2a - depois da convolucao');

figure, imshow(IF), title('Figura 2b com filtro')
figure, imhist(IF), title('Histograma da imagem 2b - depois da convolucao');