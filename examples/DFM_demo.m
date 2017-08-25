clear all
clc
parameter_settings;
load('network.mat');
GalleryPath = '..\data\Gallery\';
ProbePath = '..\data\Probe\';
GalleryFeature = FeatureExtract(GalleryPath,net,feature_map_selection_index,'Gallery');
ProbeFeature = FeatureExtract(ProbePath,net,feature_map_selection_index,'Probe');

fprintf('Recognition...\n')
for i =1:length(ProbeFeature)
    [Dictionary,cumNumEachGalImg,feature_p] = DynamicDictionaryConstruction(ProbeFeature{i}, GalleryFeature);
    Dictionary = double(Dictionary');
    batch_size = size(Dictionary, 1);
    AtA = Dictionary*Dictionary';
    [B S stat] = sparse_coding(AtA,3.1, Dictionary', double(feature_p), num_bases, beta, sparsity_func, epsilon, num_iters, batch_size, fname_save, Binit);
    for m = 1:length(cumNumEachGalImg)-1
        SubCoding = S(cumNumEachGalImg(m)+1:cumNumEachGalImg(m+1));
        SubDictionary = Dictionary(cumNumEachGalImg(m)+1:cumNumEachGalImg(m+1),:);
        recovery = SubCoding'*SubDictionary;
        score(m) = mean(sum((recovery-double(feature_p')).^2))-2*(feature_p'*SubDictionary')*SubCoding;
    end
    LastScore(:,i) = score;
end
fprintf('Finish...\n')
accuracy = calrank(LastScore,1:10,'ascend');




%     aaa(sen,:) = accuracy;
% end