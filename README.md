Run DFM\examples\DFM_demo.m
model file: https://pan.baidu.com/s/1i4PVrsp, put it into DFM\examples\.


Abstract—Compact features can be represented by many typical deep Convolutional Neural Networks (CNNs) that usually require afixed-sized input image. The requirement results in that they cannot address partial faces of an arbitrary size/scale. Partial faces areeasily captured by surveillance cameras or hand-held devices (e.g, mobile phones) in less controlled conditions and they are neededfor personal identification. In this paper, we propose a novel partial face recognition approach based on the Fully ConvolutionalNetworks (FCNs) and Sparse Representation Classification (SRC), called Dynamic Feature Matching (DFM), that can address holisticfaces as well as partial faces regardless of face size/scale without further preprocessing. The DFM do not requires prior positioninformations of partial faces against a holistic face and yields a speedup without repeatedly computing the convolutional layers incomparison with some existing Region-based CNN (R-CNN) approaches. In the DFM, we compute the correspondingly-sized featuremaps from entire image only once. We demonstrate that the DFM achieves state-of-the-art performace in computation efficient andaccuracy on several partial face databases, including partial faces captured in hand-held devices and iris recognition systems at adistance, simulated partial faces cropped from the LFW dataset. The power of the DFM is also significant in partial personre-identification on Partial RE-ID and iLIDS databases.

<div align=center><img width="376" height="240" src="https://github.com/lingxiao-he/dfm_new/blob/master/images/PF.jpg"/></div>
<div align=center><img width="513" height="219" src="https://github.com/lingxiao-he/dfm_new/blob/master/images/framework.jpg"/></div>
<div align=center><img width="916" height="235" src="https://github.com/lingxiao-he/dfm_new/blob/master/images/Result.jpg"/></div>

