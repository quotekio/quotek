Time Series Analysis
====================

Position detection, thereholds
------------------------------

.. doxygenfunction:: quotek::quant::above

.. doxygenfunction:: quotek::quant::cross

.. doxygenfunction:: quotek::quant::cross_ex

Basic analysis
--------------

.. doxygenfunction:: quotek::quant::min

.. doxygenfunction:: quotek::quant::max

.. doxygenfunction:: quotek::quant::average

.. doxygenfunction:: quotek::quant::weighted_average

.. doxygenfunction:: quotek::quant::variance

.. doxygenfunction:: quotek::quant::variance_q

.. doxygenfunction:: quotek::quant::covariance

.. doxygenfunction:: quotek::quant::covariance_q

.. doxygenfunction:: quotek::quant::standard_deviation

.. doxygenfunction:: quotek::quant::normal_cumulative_distribution

.. doxygenfunction:: quotek::quant::standard_normal_distribution






Moving Averages
---------------

.. doxygenfunction:: quotek::quant::moving_average

.. doxygenfunction:: quotek::quant::exponential_moving_average

.. doxygenfunction:: quotek::quant::weighted_moving_average

.. doxygenfunction:: quotek::quant::triple_exponential_moving_average


Advanced Statistical Analysis
-----------------------------

.. doxygenfunction:: quotek::quant::linear_regression(quotek::data::records&)

.. doxygenfunction:: quotek::quant::linear_regression(quotek::data::records&, std::vector<float>&)

.. doxygenfunction:: quotek::quant::polynomial_regression

.. doxygenfunction:: quotek::quant::autocorrelation


Other Forecasting Methods
-------------------------

.. doxygenfunction:: quotek::quant::trend_percentages

.. doxygenfunction:: quotek::quant::risk_reward_ratio


Dedicated Data Structures
-------------------------

.. doxygenstruct:: quotek::quant::affine
   :members:
   :protected-members:
   :private-members:

.. doxygenstruct:: quotek::quant::trinom
   :members:
   :protected-members:
   :private-members:

.. doxygenstruct:: quotek::quant::_greeks
   :members:
   :protected-members:
   :private-members:

.. doxygenstruct:: quotek::quant::pivot
   :members:
   :protected-members:
   :private-members:

.. doxygenstruct:: quotek::quant::fibo_ret
   :members:
   :protected-members:
   :private-members:

.. doxygenstruct:: quotek::quant::fibo_ext
   :members:
   :protected-members:
   :private-members:

.. doxygenstruct:: quotek::quant::trend_p
   :members:
   :protected-members:
   :private-members:


Example
-------

In the following example we will see how to use the statistical analysis functions listed above.

.. code-block:: c++

    #include <quotek/record.hpp>
    #include <quotek/quant.hpp>
    using namespace quotek::data;
    using namespace quotek::quant;

    int main() {


      /* First we create fake data. */      

      std::vector<long> tstamps = { 1437143900, 
                                    1437143901, 
                                    1437143902, 
                                    1437143903, 
                                    1437143904, 
                                    1437143905, 
                                    1437143906, 
                                    1437143907, 
                                    1437143908 };

      std::vector<float> vals = { 4530, 4575, 4890, 4235, 4144, 4356, 4588, 4720, 4989 };


      /* Then we create a records container from these data. */
      records r1 = records(vals);
     
      for (int i=0;i< r1.size(); i++ ) {
        r1[i].timestamp = tstamps[i];
        
      }

      /* We find the minimum value inside the r1 time-series, value is 4144. */
      float minval = min(r1);
      
      /* Now we compute the 5 periods Exponential moving average for the r1 time-series.
         Result is the following: {4552.5, 4560, 4670, 4525, 4398, 4384, 4452, 4541.33 }. */

      records r3 = EMA(r1,5);

      /* Finally We compute the linear regression of the r1 time-series. Affine parameters are 
      (29.8, 4409.56) */

      affine af = linear_regression(r1);
    }

|
|
|
|

