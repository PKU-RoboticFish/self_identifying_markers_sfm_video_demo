clc;clear;close all;

%% 将txt数据导入matlab环境中

load_points_video;

%% 加载标定参数

load('.\CameraParams.mat');

%% demo: 特征点序号可视化

img_idx = 1; % 选择范围: [1, size(points,1)]

points = points_video{img_idx,:};
img = imread(strcat('.\registration_image\video',num2str(points_video{img_idx,2}),'\',num2str(points_video{img_idx,3}),'.jpg'));
img = insertText(img, points_video{img_idx,1}(:,2:3),  points_video{img_idx,1}(:,1),'FontSize',35);
img = insertMarker(img, points_video{img_idx,1}(:,2:3), 'o', 'Color', 'red', 'Size', 15);
imshow(img);

%% demo: 统计相邻三帧的共同点个数

% 每个数字代表了当前帧及其前两帧共同点个数，从第3帧起以后有效。
common_num = zeros(size(points_video,1),1);
for i = 3:1:size(points_video,1)
    common_points = intersect(points_video{i,1}(:,1),points_video{i-1,1}(:,1));
    common_points = intersect(common_points,points_video{i-2,1}(:,1));
    common_num(i,1) = numel(common_points);
end

numel(find(common_num<3)) - 2
