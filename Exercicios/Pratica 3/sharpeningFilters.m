clear; clc; close all;
pkg load image;

%Questao 1
IMAGE = imread('dip-xe.png');
figure, imshow(IMAGE), title('Imagem Original');

gaussian = fspecial('gaussian', [5 5], 3);
filteredImageGaussian = imfilter(double(IMAGE), gaussian);
figure, imshow(uint8(filteredImageGaussian)), title('Imagem Com Filtro Gaussiano');

mask = double(IMAGE) - double(filteredImageGaussian);
figure, imshow(mask, []), title('Imagem da Mascara de Nitidez');

filteredImageSharpness = IMAGE + mask;
figure, imshow(filteredImageSharpness), title('Imagem Filtrada com Mascara de Nitidez');

filteredImageSharpnessHighBoost = IMAGE + (4.5 * mask);
figure, imshow(filteredImageSharpnessHighBoost), title('Imagem com filtragem high-boost');

%Questao 2
IMAGE2 = imread('contact_lens_original.tif');
figure, imshow(IMAGE2), title('Imagem Original');

maskSobel1 = [-1 -2 -1; 0 0 0; 1 2 1];
maskSobel2 = [-1 0 1; -2 0 2; -1 0 1];

filteredImageSobel1 = imfilter(double(IMAGE2), maskSobel1);
filteredImageSobel2 = imfilter(double(IMAGE2), maskSobel2);

filteredImageSobel = sqrt((filteredImageSobel1.*filteredImageSobel1)+(filteredImageSobel2.*filteredImageSobel2));
figure, imshow(uint8(filteredImageSobel)), title('Gradiente de sobel');