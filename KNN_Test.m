function [skincondition_Error_Rate,skincondition_Accuracy_Rate]= KNN_Test()
MFile=load('knnmodels');
File=load('skindata');
%==================Speech Disorder======================================%
[skincondition,skincondition_score,Fruit_cost] = predict(MFile.KNNStruct_features_quality,File.features);
KNN_skincondition_Analysis = classperf(File.condition,skincondition);
skincondition_Error_Rate=KNN_skincondition_Analysis.ErrorRate;
skincondition_Accuracy_Rate=KNN_skincondition_Analysis.CorrectRate;

%==================Speech Emotions======================================%
