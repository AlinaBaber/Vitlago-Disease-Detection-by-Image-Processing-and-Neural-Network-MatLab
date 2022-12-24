function [status]= preparefile(FilePath,FileName,image_file)
[pathstr,filename,ext] = fileparts(FilePath);
[pathstr,conditions,ext] = fileparts(pathstr) ;
[pathstr,skindisease,ext] = fileparts(pathstr) ;
File=load('skindata');
File_Name={FileName}; 
File.FileName(end+1)=File_Name; 
FileName=File.FileName;
save('skindata.mat','FileName','-append');
File_condition={conditions};
condition=[File.condition;File_condition];  
save('skindata.mat','condition','-append');

if strcmp(condition,'Infected')
   condition_nn=[1,0]; 
else
    condition_nn=[0,1];
end
File_condition_nn=condition_nn;
condition_nn=[File.condition_nn;File_condition_nn]; 
save('skindata.mat','condition_nn','-append');
File_Path={FilePath};
File.FilePath(end+1)=File_Path; 
FilePath=File.FilePath;
save('skindata.mat','FilePath','-append');
File_skindisease={skindisease};
skindisease=[File.skindisease; File_skindisease];
save('skindata.mat','skindisease','-append');
%------(1)---------Features-----------
Features=train_samples_features(image_file);
File_features=Features;
features=[File.features; File_features];
save('skindata.mat','features','-append');
status=' All Features are Extracted ,File is Prepared for Training';