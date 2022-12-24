function Features=train_samples_features(image_file)
[mean_cluster_value,color]=train_Color_Detection(image_file);
%[area,centroid,Distance,ratio]=area_feature(image_file);
%Features=[transpose(mean_cluster_value),color,area,centroid,Distance,ratio];
Features=[transpose(mean_cluster_value),color];