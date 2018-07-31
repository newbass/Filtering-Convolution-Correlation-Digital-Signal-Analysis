clear;
[l, z]= subsam(24000);
function [l, z] = subsam(freq)

[env1,Fs] = audioread('ChurchImpulseResponse-16-44p1-mono-5secs.wav');
[env2,Fs] = audioread('/home/aanshul/Downloads/carpark_balloon_ir_mono_24bit_44100.wav');
[env3,Fs] = audioread('/home/aanshul/Downloads/ir_row_1l_sl_centre.wav');
%[env,Fs] = audioread('MainStreetOne-24-96-stereo-63secs.wav');


% Recording Starts

%myVoice = audiorecorder;
%disp('Recording Start');
%recordblocking(myVoice, 2);
%disp('Recording Over');
%myV = getaudiodata(myVoice);
%sound(myV,44100);
%audiowrite('/home/aanshul/Downloads/my1.wav', myV, 44100);

% Recording Ends

[y,Fs] = audioread('/home/aanshul/Downloads/my1.wav');
%sound(y);
%plot(y);

% freq=24000;   %take that in input
[p, q] = rat(freq/Fs);
k = repelem(y, p);
l = k(1:q:end);
%sound(l, 8000);
env = env2(1:end,1:1);
z = conv(l, env);

% B = env;
% A = l;
% [m, n] = size(B);
% m
% n
% C = padarray(A,[m-1 0],0,'both');
% [cx, cy] = size(C);
% cx
% cy
% E = fliplr(B);
% F = flipud(E);
% 
% % convolution begins
% cx-m+1
% for i = 1:cx-m+1
%         K(1:m, 1:1) = F .* double(C(i:i,1:1));
%         psum = sum(K);
%         fin1(i:i, 1:1) = sum(psum);
% end
% subplot(1,2,1);
% imshow(fin1);
% z = fin1;
% % convolution ends

sound(z);
%sound(l,freq);

%x = resample(y,4000,44100);
%sound(x,freq);


subplot(1,2,1);
plot(l);

subplot(1,2,2);
plot(y);

end
