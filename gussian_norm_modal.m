
clc;
clear;
close all;
t1=clock;
I = imread('images.jpg');
A = imread('gaussian.jpg');
G = mat2gray(A);
J = zeros(size(A));
mu=0.008;
gamma = 0.004;
g = G(:,:,1);
[m,n] = size(g);
cvx_solver SeDuMi
cvx_begin
variable x(m,n)
minimize (norm(x-g,'fro')+gamma*sum(sum(abs((x(:,1:end-1)-x(:,2:end)))))+gamma*sum(sum(abs((x(1:end-1,:)-x(2:end,:))))))
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
str = ['denoising result (\gamma = '  num2str(gamma) ')'];
title(str);
t2=clock();
time=etime(t2,t1)