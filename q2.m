den= [1 74.38 5589 42107];
num= [0 3.392 -340.09 39451];

G=tf(num,den);
P= 1:1:30;
for k=input("Enter k: ")
    system=feedback(k*G,1);
    step(system);
    title("Step Response for k");

    poles=pole(system);
    if all(real(poles)<0)
        disp('system is stable');
    else
                disp('system is unstable');
    end
end