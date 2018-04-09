Logistic Regressions
====================

Logistic regressions (known as classifiers), are also a simple class of Machine Learning Algorithms. Their goal is to tell
(once they are trained ) if the data in input belongs to a specific class or not.

.. figure:: _static/img/ml_logreg.png
  :align: left
  :width: 400px
  
  Typical Logistic regression graph.

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

Note: If you want to classify data on multiple classes, you just have to train multiple classifier objects, and take the classifier output that has
the highest score.

.. doxygenclass:: quotek::ml::logisticRegression
  :members:
  :protected-members:
  :private-members:


Exemple
-------

  .. code-block:: c++

    #include <quotek/quotek.hpp>
    #include <quotek/logisticregression.hpp>

    int main(int argc, char** argv) {
    
      //We declare both a dataset and an expected result object.
      quotek::ml::dataset X;
      quotek::ml::dvector y;

      X =  MatrixXd(22,1);
      y =  VectorXd(22);

      /* This dataset will train the classifier so 
       * that any number < 10 is in class, and any number > 10 is not.
       */
      X << 10,89,112,8,32,9,12,5,23,8,56,2,3,45,6,7,15,11,13,1,999,189;
      y << 1, 0, 0, 1,0, 1,0, 1,0, 1,0, 1,1,0, 1, 1, 0, 0, 0,1,0,  0  ;

      quotek::ml::logisticRegression lr1;

      lr1.thereshold = 0.4;
      lr1.train(X,y);

      quotek::ml::dataset Xpred = MatrixXd(1,1);
      Xpred << 92, 5;

      //We create a vector to store the predictions results.
      std::vector<int> mpred;

      //We make our prediction.
      lr1.predict(Xpred, mpred);

      //We should get 2 prediction results.
      assert(mpred.size() == 2);
      
      //92 is not in class.
      assert(mpred[0] == 0);

      //5 is in class.
      assert(mpred[1] == 1);

    }

