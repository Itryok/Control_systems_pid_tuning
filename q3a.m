den= [0 1 74.38 5589 42107];
num= [0 0 3.392 -340.09 39451];
G=tf(num,den);
figure;
step(G)
for k=1:1:7
    system=feedback(k*G,1);
    figure;
    subplot(1,3,1);
    step(k*G)
    title(sprintf('open loop'))
    [y,t]=step(system);
    stepinfo_str= stepinfo(y,t);
    subplot(1,3,2);
    step(system);
     title(sprintf("tr=%.2f,ts=%.2f",stepinfo_str.RiseTime,stepinfo_str.SettlingTime))
    subplot(1,3,3);
    rlocus(system);
    title(sprintf("%d",k))
end