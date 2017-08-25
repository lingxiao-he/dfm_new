function Feature = FeatureExtract(path,net,index,type)
fprintf(strcat('Extract', type , 'feature...\n'));
filename = dir(strcat(path,'*.jpg'));

for i = 1:length(filename)
    i
    img = imread(strcat(path,filename(i).name));
    img = single(img);
    if strcmp(type,'Gallery')
        img = imresize(img,[224 224]);
    end
    img = bsxfun(@minus,img,net.meta.normalization.averageImage) ;
    res = vl_simplenn(net, img) ;
    featuremaps = res(1,32).x(:,:,index);%res(1,32).x(:);
    Feature{i} = featuremaps;
    % kk=kk+1;
end
fprintf('Finish!')