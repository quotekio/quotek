Linear Regressions
==================

Linear regression is probably one of the simplest form of Machine Learning algorithms out there.
What it does is to train a linear model based on an existing dataset (usually historical data). Once trained, the model 
can make predictions about future values of the data.

.. figure:: _static/img/ml_linreg.jpg
  :align: left
  :width: 400px

  Typical Linear regression ( real data = red crosses, model = blue line )


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

Note: A linear regression can fit way more than affine models, for that you have to add polynomial features to your dataset eg with quotek::ml::polynomial_features(dataset& X, int degree);


.. doxygenclass:: quotek::ml::linearRegression
  :members:
  :protected-members:
  :private-members:


Exemple
-------

  .. code-block:: c++

    #include <quotek/quotek.hpp>
    #include <quotek/linearregression.hpp>

    int main(int argc, char** argv) {
    
      //We declare a dataset X, and expected results y.
      quotek::ml::dataset X;
      quotek::ml::dvector y;

      X =  MatrixXd(10,1);
      y =  VectorXd(10);

      //We fill both dataset and expected results with our data.
      X << 1,2,3,4,5,6,7,8,9,10;
      y << 2,4,6,8,10,12,14,16,18,20;

      //We train our Linear regression with our data.
      quotek::ml::linearRegression l1;
      l1.train(X,y);

      //Then we can make predictions with our trained linear regression object.
      quotek::ml::dataset Xpred = MatrixXd(3,1);
      
      Xpred << 150, 200, 500;
      double pred = l1.predict(Xpred);

    }

