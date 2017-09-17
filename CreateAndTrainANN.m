

function results=CreateAndTrainANN(x,t)

    if ~isempty(x)
        

        hiddenLayerSize = 5;
        net = fitnet(hiddenLayerSize,trainFcn);

        net.input.processFcns = {'removeconstantrows','mapminmax'};
        net.output.processFcns = {'removeconstantrows','mapminmax'};

       
        net.divideFcn = 'dividerand';  % Divide data randomly
        net.divideMode = 'sample';  % Divide up every sample
        net.divideParam.trainRatio = 70/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 15/100;


        net.performFcn = 'mse';  % Mean squared error

        net.plotFcns = {};
      

        net.trainParam.showWindow=false;
        net.trainParam.epochs=5;
        
        % Train the Network
        [net,tr] = train(net,x,t);

        % Test the Network
        y = net(x);
        e = gsubtract(t,y);
        E = perform(net,t,y);
        
    else        
        
        y=inf(size(t));
        e=inf(size(t));
        E=inf;
        
        tr.trainInd=[];
        tr.valInd=[];
        tr.testInd=[];
        
    end

    % All Data
    Data.x=x;
    Data.t=t;
    Data.y=y;
    Data.e=e;
    Data.E=E;
    
    % Train Data
    TrainData.x=x(:,tr.trainInd);
    TrainData.t=t(:,tr.trainInd);
    TrainData.y=y(:,tr.trainInd);
    TrainData.e=e(:,tr.trainInd);
    if ~isempty(x)
        TrainData.E=perform(net,TrainData.t,TrainData.y);
    else
        TrainData.E=inf;
    end
    
    % Validation and Test Data
    TestData.x=x(:,[tr.testInd tr.valInd]);
    TestData.t=t(:,[tr.testInd tr.valInd]);
    TestData.y=y(:,[tr.testInd tr.valInd]);
    TestData.e=e(:,[tr.testInd tr.valInd]);
    if ~isempty(x)
        TestData.E=perform(net,TestData.t,TestData.y);
    else
        TestData.E=inf;
    end
    
    % Export Results
    if ~isempty(x)
        results.net=net;
    else
        results.net=[];
    end
    results.Data=Data;
    results.TrainData=TrainData;
    % results.ValidationData=ValidationData;
    results.TestData=TestData;
    
end