Yahoo! Finance
==============

.. image:: _static/img/yahoo_fin.jpg
    :align: left
    :width: 250px
    :class: qimg
    :alt: Yahoo Finance Logo
|
|
|
|
|
|
|
|
|


.. doxygenclass:: quotek::datasource::yahoofinance
  :members:
  :protected-members:
  :private-members:

Example
-------

.. code-block:: c++

  #include <quotek/quotek.hpp>
  #include <quotek/datasources/yahoofinance.hpp>
  using namespace quotek::datasource;
  using namespace quotek::data;

  int main(int argc, char** argv) {
  
    //We declare a new yahoofinance object.
    yahoofinance yf1;

    //now we will import the DAX EOD data for the first week of July, 2016.
    records r1_dax = yf1.close_history("^GDAXI","2016-07-01","2016-07-9");

    //We check that we got some data in r1_dax.
    assert( r1_dax.size() > 0 );

  }


|
|
|
|

