function [Result]=read_test(currentfilename)
%imagefiles = dir('test/Crop/*.png');      
%nfiles = length(imagefiles);    % Number of files found
%if (nfiles == 1)
%     currentfilename= ['test/Crop/',imagefiles.name(1)]
Result=fruit_knn_classification(currentfilename);
%     Results(1,1:2) = Result;
     
%else
%for ii=1:nfiles
%   currentfilename = 'test/Crop/'+imagefiles(ii).name;
%   im=imread(currentfilename);
%   Result=fruit_knn_classification(currentfilename);
%   Results(ii,1:2) = Result;

%end
end
