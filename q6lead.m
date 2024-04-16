den= [0 1 74.38 5589 42107];
num= [0 0 3.392 -340.09 39451];
G=tf(num,den);
for a1= -0.045
    for t=0
        k=1;
        nlead=[k*t*a1,k];
        dlead=[0 0 a1*t a1];
        lead=tf(nlead,dlead)
        sys=feedback(lead*G,1);
        figure;
        subplot(1,4,1);
        margin(sys)
        subplot(1,4,2);
        nyquist(sys);
        subplot(1,4,3);
        step(sys);
        subplot(1,4,4);
        rlocus(sys);
    end
end