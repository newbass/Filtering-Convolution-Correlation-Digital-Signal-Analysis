%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% example 
% A = [1 2 3; 4 5 6; 7 8 9];  % A is the image
clear;
tic;
A = imread('cameraman.tif');
B = [-1 -2 -1; 0 0 0; 1 2 1];    % B is the filter
Bt = B.';
[m, n] = size(B);
% m is rows
% n is columns


C = padarray(A,[(m-1)/2 (n-1)/2],0,'both');
[x, y] = size(C);
% x is rows
% y is columns


% padding the matrix with 0 on both the dimensions
% padarray(input, [rows and cols to be padded], with what, on all?)

% flipping the filter for convolution
E = fliplr(B);
F = flipud(E);
% flipping ends

% convolution begins
for i = 1:y-n+1
    for j = 1:x-m+1
        K(1:m, 1:n) = F .* double(C(i:i+m-1,j:j+n-1));
        psum = sum(K);
        fin1(i:i, j:j) = sum(psum);
    end
end
fin1 = uint8(fin1);
subplot(1,2,1);
imshow(fin1);
toc;
% convolution ends

%%%%%%%%%%%%%% 'with transpose of filter' %%%%%%%%%%%%%%%%%%%%

% flipping begins
E = fliplr(Bt);
F = flipud(E);
% flipping ends


% convolution begins
for i = 1:y-n+1
    for j = 1:x-m+1
        K(1:m, 1:n) = F .* double(C(i:i+m-1,j:j+n-1));
        psum = sum(K);
        fin2(i:i, j:j) = sum(psum);
    end
end
fin2=uint8(fin2);
toc;
subplot(1,2,2);
imshow(fin2);
% subplot(1,4,3);
figure, imshowpair(fin1,fin2,'montage');

% convolution ends

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
