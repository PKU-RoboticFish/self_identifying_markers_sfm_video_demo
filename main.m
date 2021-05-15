clc;clear;close all;

%% ��txt���ݵ���matlab������

load_points_video;

%% ���ر궨����

load('.\CameraParams.mat');

%% demo: ��������ſ��ӻ�

img_idx = 1; % ѡ��Χ: [1, size(points,1)]

points = points_video{img_idx,:};
img = imread(strcat('.\registration_image\video',num2str(points_video{img_idx,2}),'\',num2str(points_video{img_idx,3}),'.jpg'));
img = insertText(img, points_video{img_idx,1}(:,2:3),  points_video{img_idx,1}(:,1),'FontSize',35);
img = insertMarker(img, points_video{img_idx,1}(:,2:3), 'o', 'Color', 'red', 'Size', 15);
imshow(img);

%% demo: ͳ��������֡�Ĺ�ͬ�����

% ÿ�����ִ����˵�ǰ֡����ǰ��֡��ͬ��������ӵ�3֡���Ժ���Ч��
common_num = zeros(size(points_video,1),1);
for i = 3:1:size(points_video,1)
    common_points = intersect(points_video{i,1}(:,1),points_video{i-1,1}(:,1));
    common_points = intersect(common_points,points_video{i-2,1}(:,1));
    common_num(i,1) = numel(common_points);
end

numel(find(common_num<3)) - 2
