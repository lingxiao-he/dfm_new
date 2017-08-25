function [result,pre_FPR,pre_TPR]=drawROC(scores,labels,axisROC)
% scores: N x 1 matrix, whose each element is a score of a test case.
% labels: N x 1 binary matrix, whose each element is the label of a test case.
%       0 = negative, 1 = positive.
% Written by Lingxiao SONG. 2015-12-03.


%% best accuracy and ROC
% scores=reshape(scores,1,[]);
% labels=reshape(labels,1,[]);
[sort_scores,idx]=sortrows([scores labels],[1 2]);
sort_label=sort_scores(:,2)';
sort_scores=sort_scores(:,1)';
pos=sum(labels(:));
neg=length(labels)-pos;

TPR=fliplr(cumsum(fliplr(sort_label),2));
FPR=fliplr(cumsum(fliplr(1-sort_label),2));

acc=TPR+(neg-FPR);
acc=acc/(neg+pos);

[bestAcc,bestThresh]=max(acc);
TPR_atBestThresh=TPR(bestThresh)/pos;
FPR_atBestThresh=FPR(bestThresh)/neg;
bestThresh=sort_scores(bestThresh);

acc=[acc neg/(neg+pos)];
pre_TPR=[TPR/pos 0];
pre_FPR=[FPR/neg 0];
% pre_FNR=1-pre_TPR;
% t=abs(pre_FPR-pre_FNR);
% [~,EER_idx]=min(t);
% EER=pre_FNR(EER_idx);
% Thresh_atEER=sort_scores(EER_idx);

% semilogx(pre_FPR,pre_TPR,'b','LineWidth',2);
% grid on;
% %hold on
% % tt=logspace(-5,0,100);
% % semilogx(tt,tt,'r','LineWidth',2);
% ylabel('TPR');
% xlabel('FPR');
% axis([axisROC(1,1) axisROC(2,1) axisROC(3,1) axisROC(4,1)]);

%% score distribution

pos_scores=sort_scores(sort_label==1);
neg_scores=sort_scores(sort_label==0);
[n,nbin]=hist(neg_scores,30);
[p,pbin]=hist(pos_scores,30);
n=n/neg;
p=p/pos;

%figure;
% stem(nbin,n,'Marker','none','LineWidth',3);
% my_stem(nbin,n);
% hold on;
% stem(pbin,p,'r','MarkerSize',0.5,'Marker','none','LineWidth',3);
% my_stem(pbin,p,'r');
% legend('extra-person','intra-person');
% xlabel('score');
% ylabel('proportion');
% title('Score Distribution');

% 1%FPR
FPR_01=find(pre_FPR>0.01,1,'last');
TPR_at01=pre_TPR(FPR_01);
VR_at01=acc(FPR_01);
Thresh_at01=sort_scores(FPR_01-1);
% 0.1%FPR
FPR_001=find(pre_FPR>0.001,1,'last');
TPR_at001=pre_TPR(FPR_001);
VR_at001=acc(FPR_001);
Thresh_at001=sort_scores(FPR_001-1);
% 0.01%FPR
FPR_0001=find(pre_FPR>0.0001,1,'last');
TPR_at0001=pre_TPR(FPR_0001);
VR_at0001=acc(FPR_0001);
Thresh_at0001=sort_scores(FPR_0001-1);
% 0.001%FPR
FPR_00001=find(pre_FPR>0.00001,1,'last');
TPR_at00001=pre_TPR(FPR_00001);
VR_at00001=acc(FPR_00001);
Thresh_at00001=sort_scores(FPR_00001-1);
% 0FPR
FPR_0=find(pre_FPR==0,1);
TPR_at0=pre_TPR(FPR_0);
if FPR_0==length(pre_FPR)
    VR_at0=neg/(neg+pos);
    Thresh_at0='max';
else
    VR_at0=acc(FPR_0);
    Thresh_at0=sort_scores(FPR_0);
end


% plot(pre_FPR(FPR_001),TPR_at001,'k.','MarkerSize',20);
% axis([0 0.01 0.5 1]);
% roc
% roc = evaluation.evaluate('roc', scores, label);
% [res, extra] = eval_best([], total_scores, label);
% [pre_FPR, pre_TPR] = drawROC(label,total_scores,1000);

%% output
result.bestAcc = bestAcc;
result.bestThresh = bestThresh;
% result.pre_FPR = pre_FPR;
% result.pre_TPR = pre_TPR;
% result.total_score = total_scores;
result.TPR_at01=TPR_at01;
result.VR_at01=VR_at01;
result.Thresh_at01=Thresh_at01;
result.TPR_at001=TPR_at001;
result.VR_at001=VR_at001;
result.Thresh_at001=Thresh_at001;
result.TPR_at0001=TPR_at0001;
result.VR_at0001=VR_at0001;
result.Thresh_at0001=Thresh_at0001;
result.TPR_at00001=TPR_at00001;
result.VR_at00001=VR_at00001;
result.Thresh_at00001=Thresh_at00001;
result.TPR_at0=TPR_at0;
result.VR_at0=VR_at0;
result.Thresh_at0=Thresh_at0;
result.TPR_atBestThresh=TPR_atBestThresh;
result.FPR_atBestThresh=FPR_atBestThresh;
% result.EER=EER;
% result.Thresh_atEER=Thresh_atEER;