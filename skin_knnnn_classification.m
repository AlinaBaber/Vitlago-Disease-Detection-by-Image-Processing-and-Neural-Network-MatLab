function [Category,Category_cost,Category_output,Quality,Quality_score,Quality_cost]=skin_knnnn_classification(image_file)
Features=test_samples_features(image_file);
MFile= load('nnmodels');
%==================Speech Disorder======================================%
%----(1)----------Frequency--------------
[Category,Category_cost,Category_output]=neural_network_classification_Test(Features)
%[Category,Category_score,Category_cost] = predict(MFile.KNNStruct_features_fruit,Features);
%----(2)--------- Pitch Contour-----------
File=load('knnmodels');
[Quality,Quality_score,Quality_cost] = predict(File.KNNStruct_features_quality,Features);
 Result1=[Category,Category_cost,Category_output];
 Result2=[Quality,Quality_score,Quality_cost];