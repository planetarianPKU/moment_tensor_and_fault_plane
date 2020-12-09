function M=plane2mij(plane)
    for i=1:length(plane(:,1))
        fm=plane(i,:);

        phi=fm(1);
        delta=fm(2);
        lambda=fm(3);
        if phi<0 phi=phi+360;end
        if phi>360 phi=phi-360;end
        if lambda<0 lambda=lambda+360;end
        if lambda>360 lambda=lambda-360;end


        phi=max(phi,0.01);
        phi=min(phi,359.99);
        delta=max(delta,0.01);
        delta=min(delta,89.99);
        lambda=max(lambda,0.01);
        lambda=min(lambda,359.99);

        if lambda==90 lambda=89.99;end
        if lambda==180 lambda=179.99;end
        if lambda==270 lambda=269.99;end

        d2r=pi/180;
        a1=delta*d2r;
        a2=lambda*d2r;
        a3=phi*d2r;
        
        Mxx=-(sin(a1)*cos(a2)*sin(2*a3)+sin(2*a1)*sin(a2)*sin(a3)^2);
        Mxy=(sin(a1)*cos(a2)*cos(2*a3)+0.5*sin(2*a1)*sin(a2)*sin(2*a3));
        Mxz=-(cos(a1)*cos(a2)*cos(a3)+cos(2*a1)*sin(a2)*sin(a3));
        Myy=(sin(a1)*cos(a2)*sin(2*a3)-sin(2*a1)*sin(a2)*cos(a3)^2);
        Myz=-(cos(a1)*cos(a2)*sin(a3)-cos(2*a1)*sin(a2)*cos(a3));
        Mzz=sin(2*a1)*sin(a2);

        M=[Mxx,Mxy,Mxz;
            Mxy,Myy,Myz;
            Mxz,Myz,Mzz];

    end
end