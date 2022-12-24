function [mean_cluster_value,color]=test_Color_Detection(image_file)
fruit = imread(image_file);
[BW,he] = createMask(fruit);
figure,imshow(fruit), title('Fruite image');
%red = maskedRGBImage(:,:,1); % Red channel
%green = maskedRGBImage(:,:,2); % Green channel
%blue = maskedRGBImage(:,:,3); % Blue channel
%a = zeros(size(maskedRGBImage, 1), size(maskedRGBImage, 2));
%just_red = cat(3, red, a, a);
%just_green = cat(3, a, green, a);
%just_blue = cat(3, a, a, blue);
%back_to_original_img = cat(3, red, green, blue);
%figure, imshow(maskedRGBImage), title('Original image');
%figure, imshow(just_red), title('Red channel');
%figure, imshow(just_green), title('Green channel');
%figure, imshow(just_blue), title('Blue channel');
%figure, imshow(back_to_original_img), title('Back to original image');
%he = imread('hestain.png');
%figure,imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of Alan Partin, Johns Hopkins University', ...
     'FontSize',7,'HorizontalAlignment','right');
 cform = makecform('srgb2lab');
lab_he = applycform(he,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
                                  pixel_labels = reshape(cluster_idx,nrows,ncols);
figure,imshow(pixel_labels,[]), title('image labeled by cluster index');
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

figure,imshow(segmented_images{1}), title('objects in cluster 1');
figure,imshow(segmented_images{2}), title('objects in cluster 2');
figure,imshow(segmented_images{3}), title('objects in cluster 3');
mean_cluster_value = mean(cluster_center,2);
[tmp, idx] = sort(mean_cluster_value);
blue_cluster_num = idx(1);

L = lab_he(:,:,1);
blue_idx = find(pixel_labels == blue_cluster_num);
L_blue = L(blue_idx);
is_light_blue = im2bw(L_blue);
nuclei_labels = repmat(uint8(0),[nrows ncols]);
nuclei_labels(blue_idx(is_light_blue==false)) = 1;
nuclei_labels = repmat(nuclei_labels,[1 1 3]);
blue_nuclei = he;
blue_nuclei(nuclei_labels ~= 1) = 0;
%figure,imshow(blue_nuclei), title('blue nuclei');
transpose(mean_cluster_value);
color=[mean(mean(segmented_images{1})),mean(mean(segmented_images{2})),mean(mean(segmented_images{3}))];
color=[color(1,:,1),color(1,:,2),color(1,:,3)];