function [Categoryerrors,Categoryperformance]=nn_Testing()
MFile= load('nnmodels');
File=load('skindata');
Features= transpose(File.features);
outputs = MFile.NNStruct_categories(Features);
Categoryerrors = gsubtract(transpose(File.condition_nn),outputs);
Categoryperformance = perform(MFile.NNStruct_categories,transpose(File.condition_nn),outputs);
% Plots
figure, plotconfusion(transpose(File.condition_nn),outputs)
figure, ploterrhist(Categoryerrors)
Categoryerrors=transpose(Categoryerrors);
Categoryerrors=mean(Categoryerrors);


