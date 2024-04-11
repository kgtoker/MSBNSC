function labels = cubseg(hypData,cc)

[M,N,B]=size(hypData);
Y_scale = reshape(hypData,M*N,B);
Y=reshape(Y_scale,M,N,B);
p = 3;
[Y_pca] = pca(Y_scale, p);    
img = im2uint8(mat2gray(reshape(Y_pca', M, N, p)));
sigma=0.05;
K=cc;
grey_img = im2uint8(mat2gray(Y(:,:,5)));

lambda_prime = 0.8;  sigma = 10;  conn8 = 1;
labels = mex_ers(double(img),K,lambda_prime,sigma,conn8);

[height width] = size(grey_img);
[bmap] = seg2bmap(labels,width,height);
bmapOnImg = img;
idx = find(bmap>0);
timg = grey_img;
timg(idx) = 255;
bmapOnImg(:,:,2) = timg;
bmapOnImg(:,:,1) = grey_img;
bmapOnImg(:,:,3) = grey_img;

% figure;
% imshow(bmapOnImg,[]);
% imwrite(grey_img,'bmapOnImg.bmp')
% title('superpixel boundary map');