den= [0 1 74.38 5589 42107];
num= [0 0 3.392 -340.09 39451];
G=tf(num,den);
s=tf('s');
for k=-1:1:1
   for z=-1:1:1
       sys=k*(((s+z)/s));
       sys1=feedback(sys*G,1);
       figure();
       subplot(1,2,1);
       step(sys1);
       title(sprintf('Step Response',k,z));
       subplot(1,2,2);
       rlocus(sys1);
       title(sprintf('Root locus',k,z));
       poles=pole(sys1);
           if all(real(poles)<=0)
               disp('system is stable');
           else
                       disp('system is unstable');
           end
   end
end
