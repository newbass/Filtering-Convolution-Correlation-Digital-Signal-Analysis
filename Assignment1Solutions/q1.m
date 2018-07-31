clear;
I = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/blur.jpg');
%W = rgb2gray(I);
W = I;
[x, y, z] = size(W);
 
%W = imread('cameraman.tif');

%W = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/pc.jpg');


n=2;
for k=1:z
scaled(1:n*x, 1:n*y, k:k) = RESIZEBL(W(1:x, 1:y, k:k),n);
end
%scaled = RESIZENN(W, n);
figure, imshow(scaled);
figure, imshow(W);