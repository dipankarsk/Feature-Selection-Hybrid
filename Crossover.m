

function [y1, y2]=Crossover(x1,x2)

    pSinglePoint=0.1;
    pDoublePoint=0.2;
    pUniform=1-pSinglePoint-pDoublePoint;
    
    METHOD=RouletteWheelSelection([pSinglePoint pDoublePoint pUniform]);
    
    switch METHOD
        case 1
            [y1, y2]=SinglePointCrossover(x1,x2);
            
        case 2
            [y1, y2]=DoublePointCrossover(x1,x2);
            
        case 3
            [y1, y2]=UniformCrossover(x1,x2);
            
    end


end