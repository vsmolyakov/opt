function [] = deblur_opt()
%% load image

I = imread('./figures/lions.jpg');
P = double(rgb2gray(I))/255.0;
figure; imshow(P,[]); title('original');
[m,n] = size(P); mn = m*n;

%add blur
blur = 5;  mindex = 1:mn;  nindex = 1:mn;
for i = 1:blur
  mindex=[mindex i+1:mn 1:mn-i];
  nindex=[nindex 1:mn-i i+1:mn];
end
D = sparse(mindex,nindex,1/(2*blur+1));
full(D(1:15,1:10))

%apply blur
G = D*P(:);
Pb = reshape(G,m,n);
figure; imshow(Pb,[]); title('blurred');

%apply noise
%noiseSD = 50/255;
%Pn = P + noiseSD*randn(size(P));
%figure; imshow(Pn,[]); title('noisy');

%apply inpainting
%mask = imread('mask.png');
%mask = double(mask)/255.0;
%mask = imresize(mask, [m,n]);
%Pi = P + mask;
%figure; imshow(Pi,[]); title('overlayed');


%% solve min_P ||D P(:) - G||^2 + lambda ||L P(:)||^2
% where D is the blur kernel, G is the blurred image, P is the original
% image and L is the Laplacian

%regularization term
L = sparse([1:mn,2:mn,1:mn-1],  [1:mn,1:mn-1,2:mn], [4*ones(1,mn) -1*ones(1,2*(mn-1))]);
full(L(1:10,1:10))

%re-write as min_P ||A P(:) - b||^2
A = [D; 0.02 * L];
b = [G(:); zeros(mn,1)];

%solve linear least squares problem
options = optimoptions('lsqlin','Algorithm','trust-region-reflective','Display','final-detailed');
fprintf('running least squares solver\n');
tic;
x = lsqlin(A, b, [], [], [], [], zeros(mn,1), ones(mn,1), [], options);
time = toc;
fprintf('lsqlin time: %.2f sec\n', time);

Pd = reshape(x,m,n);
figure; imshow(Pd,[]); title('deblurred');

fprintf('PSNR: %0.2f\n',psnr(Pd,P));
%fprintf('PSNR: %0.2f\n',20*log10(1/sum(sum((Pd-P).^2/numel(P)))));
%fprintf('PSNR: %0.2f\n',20*log10(1/std2(Pd-P)));

end

%% notes

%TODO: search for optimization formulations of inpainting and denoising
%TODO: implement the above in python and post in opt

