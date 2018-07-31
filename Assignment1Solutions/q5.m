clear;
R = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/sample_inp.png');
R1 = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/blur.jpg');
R2 = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/F1.jpg');
R3 = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/Faces.jpg');
R4 = imread('/home/aanshul/Documents/Semester4/DSAA/Assignment1/big.jpg');

I = rgb2gray(R4);
B = [1 1 1; 0 0 0; -1 -1 -1];    % B is the filter 
res = uint8(conv2(B, I));
rest = uint8(conv2(B.', I));
imshow(rest+res);
