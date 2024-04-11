function [result] = calErrors(trueMat, predictedMat)

result.TP=0;result.FP=0;result.TN=0;result.FN=0;
      for i=1:size(trueMat,2)
              if(trueMat(i)==2 && predictedMat(i)==2)
                  result.TP=result.TP+1;
              elseif(trueMat(i)==1 && predictedMat(i)==2)
                  result.FP=result.FP+1;
              elseif(trueMat(i)==1 && predictedMat(i)==1)
                  result.TN=result.TN+1;
              elseif(trueMat(i)==2 && predictedMat(i)==1)
                  result.FN=result.FN+1;
              end
      end
      trueMat(trueMat == 0) = []
      totalLabeledInstances = size(trueMat,2)
      % htresult.TPs://en.wikipedia.org/wiki/Sensitivity_and_specificity
      result.TNR = round((result.TN / (result.FP + result.TN) * 100),2) ;
      result.FPR = round((result.FP / (result.FP + result.TN) * 100),2) ;
      result.TPR = round((result.TP / (result.TP + result.FN) * 100),2) ;
      result.FNR = round((result.FN / (result.TP + result.FN) * 100),2) ;
      result.OA = round(((result.TP + result.TN)/totalLabeledInstances * 100),2);
      result.AA = round(((result.TNR + result.TPR)/2),2);

      result.FScore = 2*result.TP/(2*result.TP + result.FP + result.FN);

      result.allinOne = [ result.TP result.FP result.TN result.FN result.TPR result.FPR result.TNR result.FNR result.FScore result.OA result.AA ]
      
      
      