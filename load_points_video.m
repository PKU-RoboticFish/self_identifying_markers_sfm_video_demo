%% ��ͼ��������txt�е������ͼ����ֵ������㼰�����
% ���a5����a4����
% ��������points_video
% points_video1, points_video2, points_video3��cell���飬�������˸���ͼ������ȡ���������㼰�����
% ������Ƶ����ʱ��˳���з֣��ϲ�����ȥ����Ч֡���γ�points_video

res_location = '.\detect_result\video1\';
idx = 1:1:291;
idx_bias = 0;
points_video1 = cell(numel(idx),3);
for i = idx
    fid = fopen(strcat(res_location,num2str(i),'.txt'),'r');
    markers = [];
    while ~feof(fid)
        str = fgetl(fid);   % ��ȡһ��, str���ַ���
        split_list = strsplit(str,{':',' '});
        if strcmp(split_list{1},'matrix_coordinate')
            markers = [markers; [str2double(split_list{2}),str2double(split_list{4}),str2double(split_list{5})]];
        end
    end
    fclose(fid);
    points_video1{i-idx_bias,1} = markers;
    points_video1{i-idx_bias,2} = 1;
    points_video1{i-idx_bias,3} = i;
end

res_location = '.\detect_result\video2\';
idx = 1:1:428;
idx_bias = 0;
points_video2 = cell(numel(idx),3);
for i = idx
    fid = fopen(strcat(res_location,num2str(i),'.txt'),'r');
    markers = [];
    while ~feof(fid)
        str = fgetl(fid);   % ��ȡһ��, str���ַ���
        split_list = strsplit(str,{':',' '});
        if strcmp(split_list{1},'matrix_coordinate')
            markers = [markers; [str2double(split_list{2}),str2double(split_list{4}),str2double(split_list{5})]];
        end
    end
    fclose(fid);
    points_video2{i-idx_bias,1} = markers;
    points_video2{i-idx_bias,2} = 2;
    points_video2{i-idx_bias,3} = i;
end

res_location = '.\detect_result\video3\';
idx = 1:1:391;
idx_bias = 0;
points_video3 = cell(numel(idx),3);
for i = idx
    fid = fopen(strcat(res_location,num2str(i),'.txt'),'r');
    markers = [];
    while ~feof(fid)
        str = fgetl(fid);   % ��ȡһ��, str���ַ���
        split_list = strsplit(str,{':',' '});
        if strcmp(split_list{1},'matrix_coordinate')
            markers = [markers; [str2double(split_list{2}),str2double(split_list{4}),str2double(split_list{5})]];
        end
    end
    fclose(fid);
    points_video3{i-idx_bias,1} = markers;
    points_video3{i-idx_bias,2} = 3;
    points_video3{i-idx_bias,3} = i;
end

% ��Ƶ1��3�漰��ϵ����⣬��ֻ����Ƶ2��
% points_video = [points_video1; points_video2; points_video3];
points_video = points_video2;
idx_empty = [];
for i = 1:1:size(points_video,1)
    if isempty(points_video{i,1})
        idx_empty = [idx_empty i];
    end
end

for i = 1:1:numel(idx_empty)
   copyfile(strcat('.\registration_image\video',num2str(points_video{idx_empty(i),2}),'\',num2str(points_video{idx_empty(i),3}),'.jpg'), strcat('.\failed_image\video',num2str(points_video{idx_empty(i),2}),'\'));
end

points_video(idx_empty,:) = [];
clearvars -except points_video