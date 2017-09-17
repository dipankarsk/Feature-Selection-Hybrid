

function data=LoadData()

    dataset=load('bodyfat_data3');
    data.x=dataset.input;
    data.t=dataset.target;
    
    data.nx=size(data.x,1);
    data.nt=size(data.t,1);
    data.nSample=size(data.x,2);

end