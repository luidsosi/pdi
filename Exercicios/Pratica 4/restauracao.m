% limpar
clear; clc; close all;
%carrega pacote de imagem
pkg load image;
%carrega pacote de estatistica
pkg load statistics;

% funções
min_func = @(x) min(x(:));
max_func = @(x) max(x(:));
harmmean_func = @(x) harmmean(x(:));
mean_func = @(x) mean(x(:));
median_func = @(x) median(x(:));
geomean_func = @(x) geomean(x(:));
midpoint_func = @(x) (min(x(:)) + max(x(:)))/2;
trimmean_func = @(x) trimmean(x(:), 20);

% configurações do filtro
wSize = 3; % tamanho da janela

%a
% imagem ruidosa
SALT = im2double(imread('circuit-board-salt-prob-pt1.tif'));
% aplicar filtro
SALTmin = nlfilter(SALT,[wSize wSize],min_func);
SALTmax = nlfilter(SALT,[wSize wSize],max_func);
SALTharmmean = nlfilter(SALT,[wSize wSize],harmmean_func);
% exibir imagens
figure(1),subplot(1,4,1), imshow(SALT), title('Original (ruido sal)');
figure(1),subplot(1,4,2), imshow(SALTmin), title('Min');
figure(1),subplot(1,4,3), imshow(SALTmax), title('Max');
figure(1),subplot(1,4,4), imshow(SALTharmmean), title('Harmmean');

%c
% imagem ruidosa
PEPPER = im2double(imread('circuit-board-pepper-prob-pt1.tif'));
% aplicar filtro
PEPPERmin = nlfilter(PEPPER,[wSize wSize],min_func);
PEPPERmax = nlfilter(PEPPER,[wSize wSize],max_func);
% exibir imagens
figure(1),subplot(1,3,1), imshow(PEPPER), title('Original (ruido pimenta)');
figure(1),subplot(1,3,2), imshow(PEPPERmin), title('Min');
figure(1),subplot(1,3,3), imshow(PEPPERmax), title('Max');

%e
% imagem ruidosa
GAUSSIAN = im2double(imread('ckt-board-gauss-var-400.tif'));
% aplicar filtro
GAUSSIANmean = nlfilter(GAUSSIAN,[wSize wSize], mean_func);
GAUSSIANmedian = nlfilter(GAUSSIAN,[wSize wSize], median_func);
GAUSSIANgeomean = nlfilter(GAUSSIAN,[wSize wSize], geomean_func);
% exibir imagens
figure(1),subplot(1,4,1), imshow(GAUSSIAN), title('Original (ruido gaussiano)');
figure(1),subplot(1,4,2), imshow(GAUSSIANmean), title('Mean');
figure(1),subplot(1,4,3), imshow(GAUSSIANmedian), title('Median');
figure(1),subplot(1,4,4), imshow(GAUSSIANgeomean), title('Geomean');

%f
% imagem ruidosa
UNIFORM = im2double(imread('ckt-uniform-var-800.tif'));
% aplicar filtro
UNIFORMmidpoint = nlfilter(UNIFORM,[wSize wSize], midpoint_func);
% exibir imagens
figure(1),subplot(1,2,1), imshow(UNIFORM), title('Original (ruido uniforme)');
figure(1),subplot(1,2,2), imshow(UNIFORMmidpoint), title('Mid Point');

%g
% imagem ruidosa
SALTPEPPER = im2double(imread('ckt-uniform-plus-saltpepr-prob-pt1.tif'));
% aplicar filtro
SALTPEPPERtrimmean = nlfilter(SALTPEPPER,[wSize wSize], trimmean_func);
% exibir imagens
figure(1),subplot(1,2,1), imshow(SALTPEPPER), title('Original (ruido uniforme + sal + pimenta)');
figure(1),subplot(1,2,2), imshow(SALTPEPPERtrimmean), title('Trim Mean');
