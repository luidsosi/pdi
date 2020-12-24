% limpar
clear; clc; close all;
% carrega o pacote de imagens
pkg load image;

% carrega a imagem
image = imread('teste.jpg');
figure, imshow(image), title('Imagem Original');
figure, imhist(image), title('Histograma Original');

T = 30;

imageT = false(size(image));
imageT(image>=T) = true;

figure, imshow(imageT), title('Complemento da Imagem limiarizada');

centroids = round(cat(1, regionprops(imageT, "Centroid").Centroid));

imageCent = false(size(image));
for i=1:size(centroids,1)
    imageCent(centroids(i,2),centroids(i,1)) = true;
end;

figure, imshow(imageCent), title('Imagem com os centroids');

dist = 0.1;
img = im2double(image);
segmentation = false(size(img));
for i=1:size(centroids,1)
J = regiongrowing(img,centroids(i,2),centroids(i,1),dist);
segmentation(J==true) = true;
end;
figure, imshow(segmentation), title('Imagem Segmentada');