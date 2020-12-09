function plane=ev2plane(e,v)
    ex=e(1);ey=e(2);ez=e(3);
    vx=v(1);vy=v(2);vz=v(3);
    delta=acosd(-vz);
    
    phi=atand(-vx/vy);
    if vy<0;phi=phi+180;end
    if phi>=360;phi=phi-360;end
    if phi<0;phi=phi+360;end
    a1=-ez/sind(delta);
    a2=ex*cosd(phi)+ey*sind(phi);
    lambda=atand(a1/a2);

    if a2<0;lambda=lambda+180;end
    if 90<delta && delta<180
        delta=180-delta;
        phi=180+phi;
        lambda=360-lambda;
    end
    if phi>=360;phi=phi-360;end
    if phi<0;phi=phi+360;end
    if lambda>=360;lambda=lambda-360;end
    if lambda<0;lambda=lambda+360;end
    plane=[phi,delta,lambda];
end