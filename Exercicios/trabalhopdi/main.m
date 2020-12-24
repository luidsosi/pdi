clear; clc; close all;
pkg load image;

% 1

I = imread('headCT-Vandy.png');
b = strel('rectangle',[3 3]);

erosao = imerode(I,b);
abertura = imopen(I, b);
dilatacao = imdilate(abertura,b);
gradiente = dilatacao - erosao;

figure(1),subplot(2,2,1), imshow(I), title("Original");
figure(1),subplot(2,2,2), imshow(erosao), title("Erosao");
figure(1),subplot(2,2,3), imshow(dilatacao), title("Dilatacao");
figure(1),subplot(2,2,4), imshow(gradiente), title("Gradiente");

% 2

I = imread('rice.png');

T = multithresh(I);
limiar = imquantize(I,T);

b = strel("disk",40,0);

erosao = imerode(I,b);
abertura = imopen(I, b);
dilatacao = imdilate(abertura,b);
abrir = erosao + dilatacao;
top_hat = imtophat(I,b);

T1 = multithresh(top_hat);
limiar1 = imquantize(top_hat,T1);

figure(1),subplot(2,3,1), imshow(I), title("Original");
figure(1),subplot(2,3,2), imshow(limiar,[]), title("Otsu");
figure(1),subplot(2,3,3), imshow(abrir), title("Abertura");
figure(1),subplot(2,3,4), imshow(top_hat), title("Top-hat");
figure(1),subplot(2,3,5), imshow(limiar1,[]), title("Otsu apos Top-hat");

% 3 

I = imread('dark_blobs.png');
b = strel("disk",30,0);
fechamento = imclose(I,b);

b1 = strel("disk",60,0);
abertura = imopen(fechamento,b1);

se = ones(3,3);
erosao = imerode(abertura,se);
dilatacao = imdilate(abertura,se);

gradiente = dilatacao - erosao;
gradiente = im2bw(gradiente,graythresh(gradiente));

img = I;
img(gradiente==1) = 255;

figure(1),subplot(2,2,1), imshow(I), title("Original");
figure(1),subplot(2,2,2), imshow(abertura), title("Abertura");
figure(1),subplot(2,2,3), imshow(fechamento), title("Fechamento");
figure(1),subplot(2,2,4), imshow(img), title("Fronteira");
