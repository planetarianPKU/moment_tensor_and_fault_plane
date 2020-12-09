
%date=[1900 1 1];
%d=date2julday(date);
d=139;
phi=mod(d,360);delta=mod(phi,90);
lambda1=mod(d,180);lambda2=-mod(d,180);
lambdalst=[lambda1,lambda2];
Plane=[];
for i=1:length(lambdalst)
    lambda=lambdalst(i);
    if lambda<0;lambda=lambda+360;end
    ex=cosd(lambda)*cosd(phi)+sind(lambda)*cosd(delta)*sind(phi);
    ey=cosd(lambda)*sind(phi)-sind(lambda)*cosd(delta)*cosd(phi);
    ez=-sind(lambda)*sind(delta);
    e=[ex,ey,ez];
    
    vx=-sind(delta)*sind(phi);
    vy=sind(delta)*cosd(phi);
    vz=-cosd(delta);
    v=[vx,vy,vz];
    
    M=plane2mij([phi,delta,lambda]);
    disp(e)
    disp(v)
    disp(M)
    [t,b,p]=mij2tbp(M);
    disp(t)
    disp(b)
    disp(p)
    e1=(t+p)/sqrt(2);v2=e1;
    e2=(t-p)/sqrt(2);v1=e2;
    plane=mij2plane(M);
    disp(e1)
    disp(v1)
    disp(e2)
    disp(v2)
    disp(plane)
    fprintf(['plane ',num2str(i),' has done\n']);
    Plane=[Plane;plane];
end