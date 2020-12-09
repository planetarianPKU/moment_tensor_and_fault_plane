function plane=mij2plane(M)
    [t,b,p]=mij2tbp(M);
    e=(t+p)/sqrt(2);
    v=(t-p)/sqrt(2);
    plane1=ev2plane(e,v);
    plane2=ev2plane(v,e);
    plane=[plane1;plane2];
end