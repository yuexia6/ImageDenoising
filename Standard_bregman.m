
clc;
clear;
close all;
t1=clock;
I = imread('images.jpg');
A = imread('gaussian.jpg');
G = mat2gray(A);
J = zeros(size(A));
mu = 20;
g = G(:,:,1);
[m,n] = size(g);
cvx_begin
cvx_solver MOSEK;
variable x(m,n)
minimize (mu/2*norm(x)+1/2*norm(x-g))
cvx_end
J(:,:,1) = x;
J(:,:,2) = x;
J(:,:,3) = x;
figure;
subplot(131);
imshow(I)
title('original image');
subplot(132);
imshow(G)
title('noise image');
subplot(133);
imshow(mat2gray(J));
str = ['denoising result (\gamma = '  num2str(mu) ')'];
title(str);
t2=clock();
time=etime(t2,t1)