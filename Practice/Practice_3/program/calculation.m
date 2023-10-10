%%
clear all
pz1 = 0.34;pz2 = 0.64;
a1 = -(pz1+pz2);
a2 = pz1*pz2;
z1 = 0.56;z2 = 0.65;z3 = 0.98;z4 = 0.18;
b1 = 0.1087;b2 = 0.0729;
%%
syms r q0 q1 q2
eqn1 = r + q0*b1 == -1*(z1+z2+z3+z4)+1-a1;
eqn2 = r*(a1-1) + q0*b2 +q1*b1 ==z1*z2+z3*z4+(z1+z2)*(z3+z4)-a2+a1;
eqn3 = r*(a2-a1)+q1*b2+q2*b1 == -1*z1*z2*(z3+z4)-z3*z4*(z1+z2)+a2;
eqn4 = q2*b2-r*a2 == z1*z2*z3*z4;
[r,q0,q1,q2]=solve(eqn1,eqn2,eqn3,eqn4,r,q0,q1,q2)
%%
u = zeros(1,6);
u(1) = q0;
u(2) = (1-r)*u(1)+q0+q1;
for i = 3:1:6
    u(i) = (1-r)*u(i-1)+r*u(i-2)+q0+q1+q2;
end
u
%%
clear all
syms q0 q1 q2
K_0 = 1.2;c_I = 0.175;c_D = 0.8;
K = K_0/2;
eqn1 = q0-q2 == K;
eqn2 = q2/K ==c_D;
eqn3 = (q0+q1+q2)/K == c_I;
[q0,q1,q2] = solve(eqn1,eqn2,eqn3,q0,q1,q2)






