%% This file demonstrates the Split Bregman method for Total Variation denoising
%
%   SB_ATV.m  Split Bregman Anisotropic Total Variation Denoising
%   SB_ITV.m  Split Bregman Isotropic Total Variation Denoising
%
% Benjamin Trémoulhéac
% University College London
% b.tremoulheac@cs.ucl.ac.uk
% April 2012

clc; clear all;
close all;


f = double(imread('images','jpg'));
f = f(:,:,1);
sizearray=size(f)
N = sizearray(1); n = N^2;
t1=clock;
i = double(imread('gaussian','jpg'));
g = i(:,:,1)

mu = 60;

g_denoise_atv = SB_ATV(g,mu);
t2=clock();
time=etime(t2,t1)
g_denoise_itv = SB_ITV(g,mu);
t2=clock();
time=etime(t2,t1)
fprintf('ATV Rel.Err = %g\n',norm(g_denoise_atv(:) - f(:)) / norm(f(:)));
fprintf('ITV Rel.Err = %g\n',norm(g_denoise_itv(:) - f(:)) / norm(f(:)));

figure; colormap gray;
subplot(221); imagesc(f); axis image; title('Original');
subplot(222); imagesc(reshape(g,N,N)); axis image; title('Noisy');
subplot(223); imagesc(reshape(g_denoise_atv,N,N)); axis image; 
title('Anisotropic TV denoising');
subplot(224); imagesc(reshape(g_denoise_itv,N,N)); axis image; 
title('Isotropic TV denoising');
