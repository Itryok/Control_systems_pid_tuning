clc;
clear all;
close all;
den= [0 1 74.38 5589 42107];
num= [0 0 3.392 -340.09 39451];
G=tf(num,den);
figure;
[y,t]=step(1*G); 
stepinf_str= stepinfo(y,t); 
step(3*G)
title(sprintf("tr=%.2f,tp=%.2f",stepinf_str.RiseTime,stepinf_str.PeakTime));
for k1 = 3
    for k2=0
        for k3= 0.03
            den= conv([0 1 74.38 5589 42107],[1 0]);
            num= conv([0 0 3.392 -340.09 39451],[0 k3 k2 k1]);
            sys = tf(num,den);
            system = feedback(sys,1);
            figure;
            subplot(1,2,1);
            rlocus(system)
            subplot(1,2,2);
            inf=stepinfo(system);
            step(system)
            title(sprintf("tr=%.2f,tp=%.2f",inf.RiseTime,inf.PeakTime));
            poles=pole(system);
    if all(real(poles)<0)
        disp('system is stable');
    else
                disp('system is unstable');
        end
    end
    end
end




