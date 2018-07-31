function R = RESIZENN(W, n)

%I = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/F1.jpg');
%W = rgb2gray(I);
%n = 5;
[x, y, z] = size(W);
% x is the rows
% y is the columns

for ch = 1:z
    for a = 1:x
        R(a*n-n+1:a*n, 1:n*y, ch:ch) = repmat(repelem(W(a:a, 1:y, ch:ch), n), n, 1);
    end
end
end


% 1 to n
% n+1 to 2*n
