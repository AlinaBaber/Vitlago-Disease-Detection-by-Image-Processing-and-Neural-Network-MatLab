function [Status]=read_training_png(currentfolder)
imagefiles2 = dir(strcat(currentfolder,'\*.png'));      
nfiles2 = length(imagefiles2); 
for iii=1:nfiles2
   currentfilename = strcat(currentfolder,'\',imagefiles2(iii).name);
   FilePath=currentfilename; FileName=imagefiles2(iii).name;
   DataPaths=currentfolder;
   image_file=currentfilename;
   status= preparefile(FilePath,FileName,image_file);
end
Status= 'Training Feature Extraction done.';