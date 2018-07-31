clear;
tic;
A = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/F1.jpg');
B = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/Faces.jpg');
X = rgb2gray(B);
H = rgb2gray(A);

%X = [1 2 3 4; 5 6 7 8; 9 10 11 12];
%H = [1 2 3; 4 5 6];

[M,N] = size(X);
m = 1:M;
n = 1:N;

[P,Q] = size(H);
p = 1:P;
q = 1:Q;

Xt = zeros([M+2*(P-1) N+2*(Q-1)]);
Xt(m+P-1,n+Q-1) = X;
%C = zeros([M+P-1 N+Q-1]);
help = sum(dot(double(H),double(H)));

for k = 1:M+P-1
    for l = 1:N+Q-1
        %Hkl = zeros([M+2*(P-1) N+2*(Q-1)]);
        %Hkl(p+k-1,q+l-1) = H;
        %conj(Hkl)
        %Hkl
        hm = Xt(k:k+P-1, l:l+Q-1);
        divider = sqrt(sum(dot(hm,hm))*help);
        C(k:k,l:l) = sum(sum(hm.*conj(double(H))))/divider;
    end
end
[ypeak, xpeak] = find(C==max(C(:)));
yoffSet = gather(ypeak-size(H,1));
xoffSet = gather(xpeak-size(H,2));
figure
imshow(X);
imrect(gca, [xoffSet+1, yoffSet+1, size(H,2), size(H,1)]);
%C = normxcorr2(B,A);
toc;