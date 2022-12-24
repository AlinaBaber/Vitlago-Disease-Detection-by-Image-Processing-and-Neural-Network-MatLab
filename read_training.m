function [Status]=read_training(currentfolder)
imagefiles = dir(strcat(currentfolder,'\*.jpg'));      
nfiles1 = length(imagefiles); 
for ii=1:nfiles1
   currentfilename = strcat(currentfolder,'\',imagefiles(ii).name);
   FilePath=currentfilename; FileName=imagefiles(ii).name;
   DataPaths=currentfolder;
   image_file=currentfilename;
   status= preparefile(FilePath,FileName,image_file);
end

Status= 'Training Feature Extraction done.';
