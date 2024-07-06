# MSBNSC
This repository contains MATLAB code for implementing the "Multi-Scale Superpixel Based Nearest Subspace Classifier For Hyperspectral Images." 
If you use the code, please cite the paper given below,

https://authors.elsevier.com/a/1jN9Q3l0%7Eht4K7

@article{TOKER2024104657,
title = {Multi-scale superpixel-based nearest subspace classifier for mucilage detection from hyperspectral PRISMA data},
journal = {Digital Signal Processing},
volume = {154},
pages = {104657},
year = {2024},
issn = {1051-2004},
doi = {https://doi.org/10.1016/j.dsp.2024.104657},
url = {https://www.sciencedirect.com/science/article/pii/S1051200424002823},
author = {Kemal Gürkan Toker and Seniha Esen Yuksel},
keywords = {Hyperspectral image classification (HSIC), Nearest subspace classifier (NSC), Canonical correlation analysis (CCA), Multiscale superpixel segmentation, Mucilage detection, Sea of Marmara},
abstract = {Hyperspectral imaging has a critical role in observing the Earth's surface, providing images with rich spectral information. As a result, it has become an essential tool for monitoring and addressing environmental issues such as pollution, water balance, and climate change. Among these challenges, marine pollution poses a significant ecological threat, as evidenced by the recent mucilage incident in Turkey in April 2021. Mucilage, a dense mucus-like substance resulting from the overgrowth of marine plankton and microorganisms, detrimentally affects marine ecosystems when its levels surge. Traditional mucilage detection involves labour-intensive sampling and laboratory analysis, rendering it impractical for vast marine environments. Remote sensing techniques offer a promising alternative for automated mucilage detection from satellite imagery. In this study, we propose a multi-scale superpixel-based classification approach for mucilage detection, using the PRISMA satellite's hyperspectral mucilage datasets captured over the Sea of Marmara. Our method performs classification by analyzing the closeness between the subspace spanned by the samples in the superpixel and the subspace spanned by the within-class training samples. We formulate the solution to this approach via a Canonical Correlation Analysis framework and show that our proposed method outperforms its competitors, especially when the training data is limited. Our comprehensive experiments include assessing the transferability of classification methods on datasets collected from different locations and at different times. We compared the performance of our proposed method with state-of-the-art spectral-spatial classification methods, including deep learning-based random patches network (RPNet), structural-kernel collaborative representation (SKCR), and window based nearest subspace classifier (WBNSC). The results show that the proposed method outperforms existing techniques in most cases. The datasets and source code are publicly available on GitHub at https://github.com/kgtoker/MSBNSC, enabling more comprehensive access and collaboration in environmental monitoring efforts.}
}

Usage
To utilize this code, follow these steps:

1. Download the (Entropy Rate Superpixel Segmentation) ERS Code:
    * Access the ERS code from the following URL:
https://github.com/mingyuliutw/EntropyRateSuperpixel
    * Download the code from the provided link.

2. Organize ERS Code:
    * Place the downloaded ERS code files into a subfolder named "Entropy Rate Superpixel Segmentation" within your project directory.
  
3. Download the mucilage dataset provided below link and place it into the folder with the same directory of MSBNSC.m.
   
    * You can download the mucilage dataset as a mat file to use in Matlab from Google Drive by clicking [here](https://drive.google.com/file/d/1Is062SwtxdFiwFcy_47Qx6lxthIPuicw/view?usp=drive_link).

5. Run the Classifier: 
    * Use the main_MSBNSC_ALL.m to run the Multi-Scale Superpixel Based Nearest Subspace Classifier
  
Notes
* Ensure that the ERS code is correctly placed in the designated subfolder to enable seamless integration with the classifier.
* Refer to the documentation within the ERS repository for additional information on its usage and functionalities.

If you use the dataset, please cite the paper given below,

@inproceedings{10.1117/12.2622287,
author = {Bahri Abaci and Murat Dede and Seniha Esen Yuksel and Mete Yilmaz},
title = {{Mucilage detection from hyperspectral and multispectral satellite data}},
booktitle = {Algorithms, Technologies, and Applications for Multispectral and Hyperspectral Imaging XXVIII},
editor = {Miguel Velez-Reyes and David W. Messinger},
organization = {International Society for Optics and Photonics},
publisher = {SPIE},
pages = {120940H},
keywords = {Multispectral, Hyperspectral, Sentinel-2, PRISMA, Mucilage, Sea snot, Sea saliva, Deep learning},
year = {2022},
doi = {10.1117/12.2622287},
URL = {https://doi.org/10.1117/12.2622287}
}


