syms a b c d e f
% 75, 52, 33, 97, 251, 211, 63, 65
eqn1 = 12*f + 20*e + 3*d + 10*c + 22*b + 19*a == 75;
eqn2 = 20*f + 3*e + 10*d + 22*c + 19*b + 23*a == 52;
eqn3 = 3*f + 10*e + 22*d + 19*c + 23*b + 16*a == 33;
eqn4 = 10*f + 22*e + 19*d + 23*c + 16*b + 0*a == 97;
eqn5 = 22*f + 19*e + 23*d + 16*c + 0*b + 21*a == 251;
eqn6 = 19*f + 23*e + 16*d + 0*c + 21*b + 23*a == 211;
eqn7 = 23*f + 16*e + 0*d + 21*c + 23*b + 16*a == 63;
eqn8 = 16*f + 0*e + 21*d + 23*c + 16*b + 18*a == 65;

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6, eqn7, eqn8], [f, e, d, c, b, a]);
A
B
X = A(1:6, 1:6)^(-1)*B(1:6);
X = flipud(X);

%B
%X = linsolve(A,B);
