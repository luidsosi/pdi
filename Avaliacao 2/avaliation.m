
# 2
% limpar
clear; clc; close all;
pkg load image;

% funçoes
min_func = @(x) min(x(:));
max_func = @(x) max(x(:));

% configuracoes do filtro
wSize = 3; % tamanho da janela

% imagens ruidosas
SALT = im2double(imread("circuit-board-salt-prob-pt1.tif"));
PEPPER = im2double(imread("circuit-board-pepper-prob-pt1.tif"));

% aplicar filtro
SALTmin = nlfilter(SALT,[wSize wSize],min_func);
SALTmax = nlfilter(SALT,[wSize wSize],max_func);

PEPPERmin = nlfilter(PEPPER,[wSize wSize],min_func);
PEPPERmax = nlfilter(PEPPER,[wSize wSize],max_func);

% exibição de imagens
figure(1),subplot(1,3,1), imshow(SALT), title("Original (ruido sal)");
figure(1),subplot(1,3,2), imshow(SALTmin), title("Min");
figure(1),subplot(1,3,3), imshow(SALTmax), title("Max");

figure(1),subplot(1,3,1), imshow(PEPPER), title("Original (ruido pimenta)");
figure(1),subplot(1,3,2), imshow(PEPPERmin), title("Min");
figure(1),subplot(1,3,3), imshow(PEPPERmax), title("Max");

#5
% limpar
clear; clc; close all;
% carrega o pacote de imagem
pkg load image;

% carregar imagem original
image = im2double(imread('circuit.png'));
% mascaras
prewittX = [-1 -1 -1; 0 0 0; 1 1 1];
prewittY = [-1 0 1; -1 0 1; -1 0 1];
% aplicar mascaras
Gx = imfilter(image, prewittX);
Gy = imfilter(image, prewittY);
% gerar imagem do gradiente atraves de aproximacao
gradient = abs(Gx) + abs(Gy);
% exibir imagens
figure(1),subplot(2,2,1), imshow(image), title('Original');
figure(1),subplot(2,2,2), imshow(Gx), title('Gx');
figure(1),subplot(2,2,3), imshow(Gy), title('Gy');
figure(1),subplot(2,2,4), imshow(gradient), title('Gradiente');

% obter o novo valor de limiar utilizando o método de Otsu
limiar = graythresh(gradient);
% limiarizar a imagem suavizada com o limiar calculado
R = im2bw(gradient, limiar); 
figure, imshow(R), title('Metodo de Otsu');

# 4
% limpar variáveis
clear; clc; close all;
% carrega o pacote de imagem
pkg load image;

% carregar imagem ruidosa
image = imread('circlesBrightDark.png');

% obter os valores dos dois limiares
T = multithresh(image,2);

% limiarizar a imagem original com o T(1) calculado
A = im2bw(image,T(1)/255);

% limiarizar a imagem original com o T(2) calculado
B = im2bw(image,T(2)/255);

% exibir as imagens   
figure(1),subplot(1,3,1), imshow(image), title('Imagem Original');
figure(1),subplot(1,3,2), imshow(A), title('Imagem A - Metodo de Otsu');
figure(1),subplot(1,3,3), imshow(B), title('Imagem B - Metodo de Otsu');
