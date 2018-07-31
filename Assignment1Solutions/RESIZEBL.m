function F = RESIZEBL(W, n)
%I = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/F1.jpg');
%W = rgb2gray(I);   From INPUT
W = double(W);
%W = [1 4 12; 16 3 7; 9 6 1];
%n = 5;   From INPUT
[x, y] = size(W);
% x is rows
% y is columns

X = rot90(W,2);

F = zeros(n*x, n*y);
nx = n*x;
ny = n*y;

for i=1:x
    for j=1:y
        F(((n*(i-1))+1):((n*(i-1))+1),((n*(j-1))+1):((n*(j-1))+1)) = X(i:i,j:j);
    end
end

for i=1:x
    for j=1:y-1
        begin = X(i:i,j:j);
        finish = X(i:i,j+1:j+1);
        addend = (finish-begin)/n;
        ix = n*(i-1)+1;
        iy = n*(j-1)+1;
        for k=1:n-1
            F(ix:ix,iy+k:iy+k)=begin+k*addend;
        end
    end
end

for i=1:x-1
    for j=1:ny-n+1
        ix = n*(i-1)+1;
        ixp = ix+n;
        ad = (F(ixp:ixp,j:j)-F(ix:ix,j:j))/n;
        for k=1:n-1
            F(ix+k:ix+k,j:j)=F(ix:ix,j:j)+ad*k;
        end
    end
end

for i=1:nx-n+1
    ad = F(i:i,ny-n+1:ny-n+1)-F(i:i,ny-n:ny-n);
    for j=ny-n+2:ny
        F(i:i,j:j)=F(i:i,j-1:j-1)+ad;
    end
end

for j=1:ny
    ad = F(nx-n+1:nx-n+1, j:j)-F(nx-n:nx-n, j:j);
    for i=nx-n+2:nx
        F(i:i,j:j)=F(i-1:i-1,j:j)+ad;
    end
end

F = uint8(rot90(F,2));
end

