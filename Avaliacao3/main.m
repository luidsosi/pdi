% limpar
clear; clc; close all;
% carregar pacote de imagem
pkg load image;
% carregar imagem original
IMAGE = imread('circuit_holes.bmp');
IMAGE2  =  imcomplement(IMAGE);
% exibir imagem original
figure, imshow(IMAGE), title('Imagem original');
CC = bwconncomp(IMAGE2);
numPixels = cellfun(@numel, CC.PixelIdxList);
[biggest,idx] = max(numPixels);
AUX = IMAGE2;
AUX(CC.PixelIdxList{idx}) = 0;
figure, imshow(AUX), title('Imagem Transformada');


% 3
% limpar
clear; clc; close all;
% carregar pacote de imagem
pkg load image;
% carregar imagem original
IMAGE = imread('circuit_holes.bmp');
PB = imfill(IMAGE,'holes');
finalImage = PB - IMAGE;
CC = bwconncomp(finalImage);
quantidadeBuracos = CC.NumObjects
menorDiametro = regionprops(CC, 'MinorAxisLength').MinorAxisLength
maiorDiametro = regionprops(CC, 'MajorAxisLength').MajorAxisLength
imshow(A);


% 4
% limpar
clear; clc; close all;
% carregar pacote de imagem
pkg load image;
% carregar imagem original
IMAGE = imread('text_page.tif');

figure, imshow (IMAGE), title ("Imagem Original");
 
b = strel("disk",40,0);
 
tophatFiltered = imtophat(IMAGE,b);

figure, imshow (tophatFiltered,[]), title ("Imagem Top-hat");
 
level1 = multithresh(tophatFiltered);
segI1 = imquantize(tophatFiltered,level1); 

figure, imshow (segI1,[]), title ("Imagem Top-hat apos a limiarizacao");