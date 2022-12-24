function Status = nn_training()
File=load('skindata');
%==================Speech Disorder======================================%
%----(1)----------Frequency--------------
index = corrSel( File.features,File.condition_nn(:,1));
a=index;
[NNStruct_categories,NNTr_categories] = neural_network_training(File.features(:,a),File.condition_nn);
save('nnmodels.mat','NNStruct_categories','-append');
save('nnmodels.mat','NNTr_categories','-append');
figure, plotperform(NNTr_categories);
figure, plottrainstate(NNTr_categories);
Status= 'NN Model has been Trained';