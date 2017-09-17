

function [y1, y2]=DoublePointCrossover(x1,x2)

    nVar=numel(x1);
    
    cc=randsample(nVar-1,2);
    c1=min(cc);
    c2=max(cc);
    
    y1=[x1(1:c1) x2(c1+1:c2) x1(c2+1:end)];
    y2=[x2(1:c1) x1(c1+1:c2) x2(c2+1:end)];

end