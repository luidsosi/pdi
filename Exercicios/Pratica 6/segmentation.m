% limpar
clear; clc; close all;
% carrega o pacote de imagens
pkg load image;

% 3
image = imread('noisy_fingerprint.tif');
figure(1),subplot(1,2,1), imshow(image), title('Imagem Original');
figure(1),subplot(1,2,2),imhist(image), title('Histograma Original');

T0 = mean(mean(image));
T = T0;
while(T-T0 >= 0)
    g1 = zeros(size(image));
    g2 = zeros(size(image));
    g1 = image(image>T);
    g2 = image(image<=T);
    mg1 = mean(mean(g1));
    mg2 = mean(mean(g2));
    T = (mg1 + mg2)/2;
endwhile
T = T/255;
BW = im2bw (image,T);
figure, imshow(BW), title('Imagem Limiarizada');

% 4
% carregar imagem ruidosa
I = imread('septagon_small_noisy_mean_0_stdv_10.tif');

% calcular o maior valor do histograma
[counts,~] = imhist(I);
maxValueHist = max(counts);
% exibir imagens
figure(1),subplot(1,2,1), imshow(imresize(I,0.5)), title('Original item(A)');
figure(1),subplot(1,2,2), imhist(I), ylim([0 maxValueHist]), title('Histograma item(B)');
[G,~] = gradient(I);
T = max(abs(G(:)))*0.65;
C = false(size(G));
C(G>=T) = true;
figure, imshow(imresize(C,0.5)), title('imagem item(C)');
D = C.*I;
figure, imshow(imresize(D,0.5)), title('imagem item(D)');
figure, imhist(D(D>0)), title('Histograma item(E)');
% obter o valor de limiar utilizando o método de Otsu
T = graythresh(D(D>0));;
% limiarizar a imagem original com o T calculado
F = im2bw(I,T); % imbinarize(D,T) no Matlab
figure, imshow(imresize(F,0.5)), title('Otsu aplicado item(F)');

% 5
% carregar imagem ruidosa
I = imread('iceberg.png');
% calcular o maior valor do histograma
[counts,~] = imhist(I);
maxValueHist = max(counts);
% exibir imagens
figure(1),subplot(1,2,1),imshow(imresize(I,0.5)), title('Original item(A)'),
figure(1),subplot(1,2,2), imhist(I), ylim([0 maxValueHist]), title('Histograma item(B)')

% Fazer a funcão multithresh 
% https://github.com/ricardofantin/octave/blob/master/multithresh/multithresh.m

[T3] = multithresh (I, 2);
V = zeros (size (I));
V(I > T3(1) & I <= T3(2)) = 0.7;
V(I > T3(2)) = 0.9;
figure, imshow (V), title('item(C)');


