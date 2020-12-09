function [t,b,p]=mij2tbp(M)    
    [V,D]=eig(M);
    d=diag(D);
    [d0,n]=sort(d,'descend');
    V=V(:,n);
    disp(d0)
    disp(V)
    t=V(:,1);b=V(:,2);p=V(:,3);
%     if t(3)>0;t=-t;end
%     if b(3)>0;b=-b;end
%     if p(3)>0;p=-p;end
end