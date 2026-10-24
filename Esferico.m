clear; close all; clc;
pkg load symbolic

syms dx dy dz L1 L2 L3 d th a alpha real
syms d1 d2 d3 d4 th1 th2 th3 a1 alpha1 alpha2 real

one = sym(1); zero = sym(0);
deg2rad_sym = @(d) sym(d) * sym(pi) / sym(180);

Tx = [one zero zero a; zero one zero zero; zero zero one zero; zero zero zero one];
Tz = [one zero zero zero; zero one zero zero; zero zero one d; zero zero zero one];
Rx = [one zero zero zero; zero cos(alpha) -sin(alpha) zero; zero sin(alpha) cos(alpha) zero; zero zero zero one];
Rz = [cos(th) -sin(th) zero zero; sin(th) cos(th) zero zero; zero zero one zero; zero zero zero one];

A = simplify(Tz*Rz*Tx*Rx);

A1 = subs(A, [d th a alpha], [d1 th1 zero alpha1]);
A2 = subs(A, [d th a alpha], [zero th2 zero alpha2]);
A3 = subs(A, [d th a alpha], [d3 th3 zero zero]);
A4 = subs(A, [d th a alpha], [d4 zero zero zero]);
T = simplify(A1*A2*A3*A4);
pretty(T)

d1_val = sym('1'); th1_val = deg2rad_sym(0); alpha1_val = deg2rad_sym(-90);
th2_val = deg2rad_sym(90); alpha2_val = deg2rad_sym(90);
d3_val = sym('1'); th3_val = deg2rad_sym(0);
d4_val = sym('1');

A1_val = double(subs(A1, [d1 th1 alpha1], [d1_val th1_val alpha1_val]));
A2_val = double(subs(A2, [th2 alpha2], [th2_val alpha2_val]));
A3_val = double(subs(A3, [d3 th3], [d3_val th3_val]));
A4_val = double(subs(A4, [d4], [d4_val]));

F0 = eye(4);
F1 = F0 * A1_val;
F2 = F1 * A2_val;
F3 = F2 * A3_val;
F4 = F3 * A4_val;

figure(1); clf; axis equal; grid on; view(3);
xlabel('x'); ylabel('y'); zlabel('z'); hold on;
esc = 0.2; mark = 5;

% Frame 0
plot3(F0(1,4), F0(2,4), F0(3,4), 'om', 'linewidth', 2, 'markersize', mark);
plot3([F0(1,4) F0(1,4)+esc*F0(1,1)], [F0(2,4) F0(2,4)+esc*F0(2,1)], [F0(3,4) F0(3,4)+esc*F0(3,1)], 'b', 'linewidth', 2);
text(F0(1,4)+esc*F0(1,1), F0(2,4)+esc*F0(2,1), F0(3,4)+esc*F0(3,1), 'x_{0}');
plot3([F0(1,4) F0(1,4)+esc*F0(1,2)], [F0(2,4) F0(2,4)+esc*F0(2,2)], [F0(3,4) F0(3,4)+esc*F0(3,2)], 'g', 'linewidth', 2);
text(F0(1,4)+esc*F0(1,2), F0(2,4)+esc*F0(2,2), F0(3,4)+esc*F0(3,2), 'y_{0}');
plot3([F0(1,4) F0(1,4)+esc*F0(1,3)], [F0(2,4) F0(2,4)+esc*F0(2,3)], [F0(3,4) F0(3,4)+esc*F0(3,3)], 'r', 'linewidth', 2);
text(F0(1,4)+esc*F0(1,3), F0(2,4)+esc*F0(2,3), F0(3,4)+esc*F0(3,3), 'z_{0}');
plot3([F0(1,4) F1(1,4)], [F0(2,4) F1(2,4)], [F0(3,4) F1(3,4)], 'k');

% Frame 1
plot3(F1(1,4), F1(2,4), F1(3,4), 'om', 'linewidth', 2, 'markersize', mark);
text(F1(1,4), F1(2,4), F1(3,4)-0.2, '{1}')
plot3([F1(1,4) F1(1,4)+esc*F1(1,1)], [F1(2,4) F1(2,4)+esc*F1(2,1)], [F1(3,4) F1(3,4)+esc*F1(3,1)], 'b', 'linewidth', 2)
text(F1(1,4)+esc*F1(1,1), F1(2,4)+esc*F1(2,1), F1(3,4)+esc*F1(3,1), 'x_{1}')
plot3([F1(1,4) F1(1,4)+esc*F1(1,2)], [F1(2,4) F1(2,4)+esc*F1(2,2)], [F1(3,4) F1(3,4)+esc*F1(3,2)], 'g', 'linewidth', 2)
text(F1(1,4)+esc*F1(1,2), F1(2,4)+esc*F1(2,2), F1(3,4)+esc*F1(3,2), 'y_{1}')
plot3([F1(1,4) F1(1,4)+esc*F1(1,3)], [F1(2,4) F1(2,4)+esc*F1(2,3)], [F1(3,4) F1(3,4)+esc*F1(3,3)], 'r', 'linewidth', 2)
text(F1(1,4)+esc*F1(1,3), F1(2,4)+esc*F1(2,3), F1(3,4)+esc*F1(3,3), 'z_{1}')
plot3([F1(1,4) F2(1,4)], [F1(2,4) F2(2,4)], [F1(3,4) F2(3,4)], 'k')

% Frame 2 e Frame 3
plot3([F2(1,4) F3(1,4)], [F2(2,4) F3(2,4)], [F2(3,4) F3(3,4)], 'k');
plot3(F3(1,4), F3(2,4), F3(3,4), 'om', 'linewidth', 2, 'markersize', mark);
text(F3(1,4), F3(2,4), F3(3,4)-0.2, '{2}')
plot3([F3(1,4) F3(1,4)+esc*F3(1,1)], [F3(2,4) F3(2,4)+esc*F3(2,1)], [F3(3,4) F3(3,4)+esc*F3(3,1)], 'b', 'linewidth', 2)
text(F3(1,4)+esc*F3(1,1), F3(2,4)+esc*F3(2,1), F3(3,4)+esc*F3(3,1), 'x_{2}')
plot3([F3(1,4) F3(1,4)+esc*F3(1,2)], [F3(2,4) F3(2,4)+esc*F3(2,2)], [F3(3,4) F3(3,4)+esc*F3(3,2)], 'g', 'linewidth', 2)
text(F3(1,4)+esc*F3(1,2), F3(2,4)+esc*F3(2,2), F3(3,4)+esc*F3(3,2), 'y_{2}')
plot3([F3(1,4) F3(1,4)+esc*F3(1,3)], [F3(2,4) F3(2,4)+esc*F3(2,3)], [F3(3,4) F3(3,4)+esc*F3(3,3)], 'r', 'linewidth', 2)
text(F3(1,4)+esc*F3(1,3), F3(2,4)+esc*F3(2,3), F3(3,4)+esc*F3(3,3), 'z_{2}')
plot3([F3(1,4) F4(1,4)], [F3(2,4) F4(2,4)], [F3(3,4) F4(3,4)], 'k');

% Frame 4
plot3(F4(1,4), F4(2,4), F4(3,4), 'om', 'linewidth', 2, 'markersize', mark);
text(F4(1,4), F4(2,4), F4(3,4)-0.2, '{3}')
plot3([F4(1,4) F4(1,4)+esc*F4(1,1)], [F4(2,4) F4(2,4)+esc*F4(2,1)], [F4(3,4) F4(3,4)+esc*F4(3,1)], 'b', 'linewidth', 2);
text(F4(1,4)+esc*F4(1,1), F4(2,4)+esc*F4(2,1), F4(3,4)+esc*F4(3,1), 'x_{3}');
plot3([F4(1,4) F4(1,4)+esc*F4(1,2)], [F4(2,4) F4(2,4)+esc*F4(2,2)], [F4(3,4) F4(3,4)+esc*F4(3,2)], 'g', 'linewidth', 2);
text(F4(1,4)+esc*F4(1,2), F4(2,4)+esc*F4(2,2), F4(3,4)+esc*F4(3,2), 'y_{3}');
plot3([F4(1,4) F4(1,4)+esc*F4(1,3)], [F4(2,4) F4(2,4)+esc*F4(2,3)], [F4(3,4) F4(3,4)+esc*F4(3,3)], 'r', 'linewidth', 2);
text(F4(1,4)+esc*F4(1,3), F4(2,4)+esc*F4(2,3), F4(3,4)+esc*F4(3,3), 'z_{3}');
