den= [0 1 74.38 5589 42107]; 
num= [0 0 3.392 -340.09 39451]; 
G=tf(num,den); 
s=tf('s'); 
for k = 0.17  
    for z = -1:1:1
        sys=k.*(s+z); 
        system=feedback(sys*G,1); 
        figure; 
        [y,t]=step(system); 
        stepinfo_str= stepinfo(y,t); 
        subplot(1,3,1);
        step(system); 
        title(sprintf("tr=%.2f,tp=%.2f,%d",stepinfo_str.RiseTime,stepinfo_str.PeakTime,z));
        subplot(1,3,2);  
        rlocus(system); 
        subplot(1,3,3);
        F = feedback(k*G,1);
        [r,x]=step(F); 
        stepinfo_kstr= stepinfo(r,x);
        step(F);
        title(sprintf("no zero,tr=%.2f,tp=%.2f,%d",stepinfo_kstr.RiseTime,stepinfo_kstr.PeakTime,k))
            poles=pole(system);
            if all(real(poles)<0)
                disp('system is stable');
            else
                        disp('system is unstable');
            end
    end
end 