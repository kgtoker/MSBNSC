# MSBNSC
This repository contains MATLAB code for implementing the "Multi-scale superpixel-based nearest subspace classifier for mucilage detection from hyperspectral PRISMA data" 
If you use the code, please cite the paper given below,

https://www.sciencedirect.com/science/article/abs/pii/S1051200424002823

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
keywords = {Hyperspectral image classification (HSIC), Nearest subspace classifier (NSC), Canonical correlation analysis (CCA), Multiscale superpixel segmentation, Mucilage detection, Sea of Marmara}
}

# Usage
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
  
# Notes
* Please ensure that the ERS code is correctly placed in the designated subfolder to enable seamless integration with the classifier.
* Refer to the documentation within the ERS repository for additional information on its usage and functionalities.

If you use the dataset, please cite the papers given below,

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
keywords = {Hyperspectral image classification (HSIC), Nearest subspace classifier (NSC), Canonical correlation analysis (CCA), Multiscale superpixel segmentation, Mucilage detection, Sea of Marmara}
}

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

The proposed method can also be used as a hyperspectral classification tool in various fields for multi-class classification. However, some issues may affect the method's performance. One of these is that the method is linear and uses spectral similarity between training and test samples during classification, which can negatively affect the performance in datasets with spectrally similar classes. Another area for improvement is that an imbalanced distribution of training data size for different classes can result in bias when classifying instances. The classes with a larger number of training samples, meaning subspaces with larger dimensions, are more likely to be selected even if it is not the correct classification. Furthermore, although our method shows strong performance with limited training data, it may not outperform deep learning approaches when extensive training data is available. 


