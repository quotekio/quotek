Going Further
=============


Now we will dive a bit more into the SDK and its functionalities. 
In this exemple, we will create a fake time-series and perform analysis on it. 

First, we include the main quotek header.

.. code-block:: c++

  #include <quotek/quotek.hpp>
  using namespace quotek::quant;
  using namespace quotek::data;

Next, we create a fake time-series that we will populate with dummy data.

.. code-block:: c++
 
  //We populate a fake time series.
  std::vector<float> fdata = { 4569.1, 4566.5, 4567.5, 4590.3, 4588.2, 4585.9, 4582.6, 4583.2, 4580.1 };

  //Then we create a time-series object from it.
  records r1(fdata);


Then, we will analyse the created time-series

.. code-block:: c++

  float min_ts =  min(r1);
  float max_ts = max(r1);
  float mean_ts = AVG(r1);
  float sigma_ts = SIGMA(r1, false);
  affine a1 = linear_regression(r1);
  
Finally, we will display all the computed value of the series on the standard output:

.. code-block:: c++

  /* We display all the results */
  std::cout << "Time-Series Properties: {min:" << min_ts 
            << ",max:" << max_ts 
            << ",avg:" << mean_ts 
            << ",sigma:" << sigma_ts 
            << ",lreg_slope:" << a1.a
            << ",lreg_intercept:" << a1.b
            << "}" << std::endl;

Full source code
----------------

You'll find below the full, merged source code which can be compiled as is:

.. code-block:: c++

  //file tsa.cpp
  #include <quotek/quotek.hpp>
  using namespace quotek::quant;
  using namespace quotek::data;

  int main(int argc, char** argv) {

    std::vector<float> fdata = { 4569.1, 4566.5, 4567.5, 4590.3, 4588.2, 4585.9, 4582.6, 4583.2, 4580.1 };
    records r1(fdata);

    float min_ts =  min(r1);
    float max_ts = max(r1);
    float mean_ts = AVG(r1);
    float sigma_ts = SIGMA(r1,false);
    affine a1 = linear_regression(r1);
    
    std::cout << "Time-Series Properties: {min:" << min_ts 
              << ",max:" << max_ts 
              << ",avg:" << mean_ts 
              << ",sigma:" << sigma_ts 
              << ",lreg_slope:" << a1.a
              << ",lreg_intercept:" << a1.b
              << "}" << std::endl;
  }


Compilation
-----------

Before being able to test, we must compile our program. If You're using linux, remember that the correct call to the compilation toolchain is the following:

``g++ -std=c++11 -I/opt/quotek/include -L/opt/quotek/lib -o tsa tsa.cpp -lpthread -lquotek -lcurl``

Otherwise, just use the 'Compile' fnction of your IDE.


Execution
---------

After having run the compiled binary, here is the ouput that you should get:

``Time-Series Properties: {min:4566.5,max:4590.3,avg:4579.27,sigma:8.67703,lreg_slope:1.99835,lreg_intercept:4569.27}``

|
|
|
|
