clear; clc; close all;
pkg load image;

image = imread('teste.jpg');
figure, imshow(image), title('Imagem Original');