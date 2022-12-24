function varargout = FCAQD(varargin)
% FCAQD MATLAB code for FCAQD.fig
%      FCAQD, by itself, creates a new FCAQD or raises the existing
%      singleton*.
%
%      H = FCAQD returns the handle to a new FCAQD or the handle to
%      the existing singleton*.
%
%      FCAQD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FCAQD.M with the given input arguments.
%
%      FCAQD('Property','Value',...) creates a new FCAQD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FCAQD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FCAQD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FCAQD

% Last Modified by GUIDE v2.5 31-Aug-2021 00:07:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FCAQD_OpeningFcn, ...
                   'gui_OutputFcn',  @FCAQD_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FCAQD is made visible.
function FCAQD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FCAQD (see VARARGIN)

% Choose default command line output for FCAQD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FCAQD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FCAQD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





function training_path_txt_Callback(hObject, eventdata, handles)
% hObject    handle to training_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of training_path_txt as text
%        str2double(get(hObject,'String')) returns contents of training_path_txt as a double


% --- Executes during object creation, after setting all properties.
function training_path_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to training_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_data_btn.
function add_data_btn_Callback(hObject, eventdata, handles)
% hObject    handle to add_data_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(gcbf, 'metricdata');
currentfolder=handles.training_path_txt.String;
Status=read_training(currentfolder);
Status=read_training_full(currentfolder);
Status=read_training_png(currentfolder);
 set(handles.training_txt,'string',Status); 


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in browse_test_file_btn.
function browse_test_file_btn_Callback(hObject, eventdata, handles)
% hObject    handle to browse_test_file_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete_test();
Result=[];
%set(handles.fruit_txt,'string',Result); 
%set(handles.quality_txt,'string',Result); 
test_im=[];
imshow(test_im);
axes(handles.test_image)
imshow(test_im);
[FileName,FilePath]=uigetfile('*.jpg','File Selector');
FullFilePath = strcat(FilePath, FileName);
handles.test_path_txt.String = FullFilePath;
test_im= imread( FullFilePath);
axes(handles.test_image)
imshow(test_im);
data = getappdata(gcbf, 'metricdata');
data.TrainFilename=FileName;  data.TrainFilePath=FullFilePath;
setappdata(gcbf, 'metricdata', data);



function test_path_txt_Callback(hObject, eventdata, handles)
% hObject    handle to test_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of test_path_txt as text
%        str2double(get(hObject,'String')) returns contents of test_path_txt as a double


% --- Executes during object creation, after setting all properties.
function test_path_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in webcam_photo_btn.
function webcam_photo_btn_Callback(hObject, eventdata, handles)
% hObject    handle to webcam_photo_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%delete_test();
winopen MyCam.exe;


% --- Executes on button press in detection_btn.
function detection_btn_Callback(hObject, eventdata, handles)
% hObject    handle to detection_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_file=handles.test_path_txt.String;
[Category,Category_cost,Category_output,Quality,Quality_score,Quality_cost]=skin_knnnn_classification(image_file);


%Results=Results(1:Total,:);
set(handles.labeltxt,'string',Quality); 
set(handles.condition1txt,'string',Category); 
set(handles.condition2txt,'string',Quality); 
set(handles.percentagetxt1,'string',Category_cost); 
set(handles.percentagetxt2,'string',Quality_score); 
set(handles.matchedtxt1,'string',Category_output); 
set(handles.matchedtxt2,'string',Quality_cost);
testimagesegmentation(image_file);



% --- Executes on button press in save_images_btn.
function save_images_btn_Callback(hObject, eventdata, handles)
% hObject    handle to save_images_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in seperate_fruits_btn.
function seperate_fruits_btn_Callback(hObject, eventdata, handles)
% hObject    handle to seperate_fruits_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clear_btn.
function clear_btn_Callback(hObject, eventdata, handles)
% hObject    handle to clear_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exit_btn.
function exit_btn_Callback(hObject, eventdata, handles)
% hObject    handle to exit_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in browse_training_btn.
function browse_training_btn_Callback(hObject, eventdata, handles)
% hObject    handle to browse_training_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.training_txt,'string','Add Data..');
FilePath= uigetdir(matlabroot,'MATLAB Root Folder');
%FullFilePath = strcat(FilePath, FileName);
handles.training_path_txt.String = FilePath;
%training_image= imread( FullFilePath);
%axes(handles.training_image)
%imshow(training_image);
data = getappdata(gcbf, 'metricdata');
%data.TrainFilename=FileName;  
data.TrainFilePath=FilePath;
setappdata(gcbf, 'metricdata', data);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to training_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of training_path_txt as text
%        str2double(get(hObject,'String')) returns contents of training_path_txt as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to training_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_data_btn.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to add_data_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in knn_trainging_btn.
function knn_trainging_btn_Callback(hObject, eventdata, handles)
% hObject    handle to knn_trainging_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[Status] = knn_training();
[Status] = nn_training();
 set(handles.training_txt,'string',Status); 


% --- Executes on button press in webcam_photo_view_btn.
function webcam_photo_view_btn_Callback(hObject, eventdata, handles)
% hObject    handle to webcam_photo_view_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dos('taskkill /F /IM MyCam.exe');
imagefiles = dir('test/Input/*.jpg');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
end

FullFilePath = strcat('test/Input/', currentfilename);
handles.test_path_txt.String = FullFilePath;
test_im= imread( FullFilePath);
axes(handles.test_image)
imshow(test_im);


% --- Executes on button press in color_graph_btn.
function color_graph_btn_Callback(hObject, eventdata, handles)
% hObject    handle to color_graph_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagefiles = dir('test/Crop/*.png');      
nfiles = length(imagefiles);    % Number of files found
Result_Color=[];
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   [mean_cluster_value]=Color_Detection(currentfilename);
   Result_Color(ii,:) = mean_cluster_value;
end
axes(handles.feature_graph)
bar3(Result_Color);  title('Color Clustering Mean Comparison');
xlabel('Fruits'); ylabel('Color Clusters Mean');



% --- Executes on button press in area_graph_btn.
function area_graph_btn_Callback(hObject, eventdata, handles)
% hObject    handle to area_graph_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagefiles = dir('test/Crop/*.png');      
nfiles = length(imagefiles);    % Number of files found
Result_area=[];
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   [area,centroid,Distance,ratio]=area_feature(currentfilename);
   Result_area(ii,:) = area;
end
axes(handles.feature_graph)
bar3(Result_area); title('Area Comparison');
xlabel('Fruits'); ylabel('Area');



% --- Executes on button press in centroid_graph_btn.
function centroid_graph_btn_Callback(hObject, eventdata, handles)
% hObject    handle to centroid_graph_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagefiles = dir('test/Crop/*.png');      
nfiles = length(imagefiles);    % Number of files found
Result_centroid=[];
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   [area,centroid,Distance,ratio]=area_feature(currentfilename);
   Result_centroid(ii,:) = centroid;
end
axes(handles.feature_graph)
bar3(Result_centroid); title('Centroid Comparison');
xlabel('Fruits'); ylabel('Centroid');


% --- Executes on button press in distance_graph_btn.
function distance_graph_btn_Callback(hObject, eventdata, handles)
% hObject    handle to distance_graph_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagefiles = dir('test/Crop/*.png');      
nfiles = length(imagefiles);    % Number of files found
Result_Distance=[];
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   [area,centroid,Distance,ratio]=area_feature(currentfilename);
   Result_Distance(ii,:) = Distance;
end
axes(handles.feature_graph)
bar3(Result_Distance); title('Perimeteric Distance Comparison');
xlabel('Fruits'); ylabel('Perimeteric Distance');




% --- Executes on button press in ratio_graph_btn.
function ratio_graph_btn_Callback(hObject, eventdata, handles)
% hObject    handle to ratio_graph_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagefiles = dir('test/Crop/*.png');      
nfiles = length(imagefiles);    % Number of files found
Result_ratio=[];
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   [area,centroid,Distance,ratio]=area_feature(currentfilename);
   Result_ratio(ii,1) = ratio;
end
axes(handles.feature_graph)
bar3(Result_ratio); title('Ratio Comparison');
xlabel('Fruits'); ylabel('Ratio');


% --- Executes on button press in color_clustering_btn.
function color_clustering_btn_Callback(hObject, eventdata, handles)
% hObject    handle to color_clustering_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test_image=handles.test_analysis_path_txt.String;
 [mean_cluster_value]=Color_Detection_test(test_image);


% --- Executes on button press in position_physical_btn.
function position_physical_btn_Callback(hObject, eventdata, handles)
% hObject    handle to position_physical_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test_image=handles.test_analysis_path_txt.String;
[area,centroid,Distance,ratio]=area_feature_test(test_image);


% --- Executes on button press in knn_eror_btn.
function knn_eror_btn_Callback(hObject, eventdata, handles)
% hObject    handle to knn_eror_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Categories,Category_Error_Rate,Category_Accuracy_Rate]= NN_Test();
handles.error_txt.String = Category_Error_Rate;
%handles.error_txt.String =Quality_Error_Rate;
handles.accuracy_txt.String = Category_Accuracy_Rate;
%handles.accuracy_txt.String = Quality_Accuracy_Rate;


% --- Executes on button press in browse_analysis_btn.
function browse_analysis_btn_Callback(hObject, eventdata, handles)
% hObject    handle to browse_analysis_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FilePath]=uigetfile('*.png','File Selector');
FullFilePath = strcat(FilePath, FileName);
handles.test_analysis_path_txt.String = FullFilePath;



function test_analysis_path_txt_Callback(hObject, eventdata, handles)
% hObject    handle to test_analysis_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of test_analysis_path_txt as text
%        str2double(get(hObject,'String')) returns contents of test_analysis_path_txt as a double


% --- Executes during object creation, after setting all properties.
function test_analysis_path_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test_analysis_path_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function classificationtxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to classificationtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=load('empty_skinndata.mat');
condition=b.condition;
features=b.features;
FileName= b.FileName;
condition_nn = b.condition_nn;
FilePath = b.FilePath;
skindisease = b.skindisease;
save('skindata.mat','FileName','-append');
save('skindata.mat','FilePath','-append');
save('skindata.mat','condition','-append');
save('skindata.mat','condition_nn','-append');
save('skindata.mat','features','-append');
save('skindata.mat','skindisease','-append');

set(handles.training_txt,'string','All previouse data has been removed please add new data and train model again'); 


% --- Executes on button press in segmentationbtn.
function segmentationbtn_Callback(hObject, eventdata, handles)
% hObject    handle to segmentationbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_file=handles.test_path_txt.String;
testimagesegmentation(image_file);


% --- Executes on button press in clearbtn.
function clearbtn_Callback(hObject, eventdata, handles)
% hObject    handle to clearbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.labeltxt,'string',' '); 
set(handles.percentagetxt1,'string',' '); 
set(handles.percentagetxt2,'string',' '); 
set(handles.matchedtxt1,'string',' '); 
set(handles.matchedtxt2,'string',' ');
%close all


% --- Executes on button press in clearperformancebtn.
function clearperformancebtn_Callback(hObject, eventdata, handles)
% hObject    handle to clearperformancebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.error_txt.String = ' ';
%handles.error_txt.String =Quality_Error_Rate;
handles.accuracy_txt.String = ' ';


% --- Executes on button press in exitbtn.
function exitbtn_Callback(hObject, eventdata, handles)
% hObject    handle to exitbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(FCAQD)
close all


% --- Executes on button press in knntrainingbtn.
function knntrainingbtn_Callback(hObject, eventdata, handles)
% hObject    handle to knntrainingbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Status] = knn_training();
 set(handles.training_txt,'string',Status); 


% --- Executes on button press in knntestingbtn.
function knntestingbtn_Callback(hObject, eventdata, handles)
% hObject    handle to knntestingbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Categoryerrors,Categoryperformance]=KNN_Test();
handles.error_txt.String = Categoryerrors;
%handles.error_txt.String =Quality_Error_Rate;
handles.accuracy_txt.String = Categoryperformance;


% --- Executes on button press in backupbtn.
function backupbtn_Callback(hObject, eventdata, handles)
% hObject    handle to backupbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=load('skindatabackup.mat');
condition=b.condition;
features=b.features;
FileName= b.FileName;
condition_nn = b.condition_nn;
FilePath = b.FilePath;
skindisease = b.skindisease;
save('skindata.mat','FileName','-append');
save('skindata.mat','FilePath','-append');
save('skindata.mat','condition','-append');
save('skindata.mat','condition_nn','-append');
save('skindata.mat','features','-append');
save('skindata.mat','skindisease','-append');

set(handles.training_txt,'string','All previouse data has been restored ready to train'); 
