function [Dictionary,cumNumEachGalImg,feature_p]=DynamicDictionaryConstruction(probe_feature, GalleryFeature)
feature_p = probe_feature(:);
feature_p = feature_p/norm(feature_p,2);
Dictionary = [];
for i = 1:length(GalleryFeature)
    numEachGalImg(i) = 0;
    Sub_dictionary = [];
    gallery_feature = single(GalleryFeature{i});
    if (size(gallery_feature,2)<size(probe_feature,2) || size(gallery_feature,1)<size(probe_feature,1))
        gallery_feature = imresize(gallery_feature,[size(probe_feature,1) size(probe_feature,2)]);
    end
    for ii = 1:(size(gallery_feature,1)-size(probe_feature,1)+1)
        for jj = 1:(size(gallery_feature,2)-size(probe_feature,2)+1)
            sub_feature = gallery_feature(ii:ii+size(probe_feature,1)-1,jj:jj+size(probe_feature,2)-1,:);
            sub_p = sub_feature(:);
            if (length(find(sub_p==0))==size(sub_p,1)*size(sub_p,2)*size(sub_p,3))
                sub_p = sub_p+0.00001;
            end
            sub_p = sub_p/norm(sub_p,2);
            Sub_dictionary = [Sub_dictionary sub_p];
        end
    end
    % end
    numEachGalImg(i) = numEachGalImg(i) + size(Sub_dictionary,2);
    Dictionary = [Dictionary Sub_dictionary];
end
totalGalKeys = sum(numEachGalImg);
cumNumEachGalImg = [0; cumsum(numEachGalImg')];