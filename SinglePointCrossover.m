

function [y1, y2]=SinglePointCrossover(x1,x2)

    nVar=numel(x1);
    
    c=randi([1 nVar-1]);
    
    y1=[x1(1:c) x2(c+1:end)];
    y2=[x2(1:c) x1(c+1:end)];

end