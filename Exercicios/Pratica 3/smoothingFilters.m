clear; clc; close all;
pkg load image;

IMAGE = imread('test_pattern_blurring_orig.tif');
figure, imshow(IMAGE), title('Imagem Original- Com Ruido');

maskAverage3 = fspecial('average', 3);
maskAverage5 = fspecial('average', 5);
maskAverage9 = fspecial('average', 9);
maskAverage15 = fspecial('average', 15);
maskAverage35 = fspecial('average', 35);

filteredImageAverage3 = imfilter(IMAGE, maskAverage3);
filteredImageAverage5 = imfilter(IMAGE, maskAverage5);
filteredImageAverage9 = imfilter(IMAGE, maskAverage9);
filteredImageAverage15 = imfilter(IMAGE, maskAverage15);
filteredImageAverage35 = imfilter(IMAGE, maskAverage35);

figure, imshow(filteredImageAverage3), title('Imagem Filtrada- Media 3x3');
figure, imshow(filteredImageAverage5), title('Imagem Filtrada- Media 5x5');
figure, imshow(filteredImageAverage9), title('Imagem Filtrada- Media 9x9');
figure, imshow(filteredImageAverage15), title('Imagem Filtrada- Media 15x15');
figure, imshow(filteredImageAverage35), title('Imagem Filtrada- Media 35x35');

filteredImageMedian3 = medfilt2(IMAGE, [3 3]);
filteredImageMedian5 = medfilt2(IMAGE, [5 5]);
filteredImageMedian9 = medfilt2(IMAGE, [9 9]);
filteredImageMedian15 = medfilt2(IMAGE, [15 15]);
filteredImageMedian35 = medfilt2(IMAGE, [35 35]);

figure, imshow(filteredImageMedian3), title('Imagem Filtrada- Mediana 3x3');
figure, imshow(filteredImageMedian5), title('Imagem Filtrada- Mediana 5x5');
figure, imshow(filteredImageMedian9), title('Imagem Filtrada- Mediana 9x9');
figure, imshow(filteredImageMedian15), title('Imagem Filtrada- Mediana 15x15');
figure, imshow(filteredImageMedian35), title('Imagem Filtrada- Mediana 35x35');