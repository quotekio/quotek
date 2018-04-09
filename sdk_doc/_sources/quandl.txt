Quandl 
======

.. image:: _static/img/quandl-logo.png
    :align: left
    :width: 200px
    :class: qimg
    :alt: Quandl data service Logo.
|
|
|
|
|
|
Below lies the documentation of the Quotek SDK quandl API Client. With it will be able to enrich your algos with premium financial data, to later process them with the help of the other SDK functions. 

You can go to https://www.quandl.com/ to signup for a Free account, and you can also check https://www.quandl.com/blog/ for extra information and resources on the API.



.. doxygenclass:: quotek::datasource::quandl
  :members:
  :protected-members:
  :private-members:


Example
-------

You will find below and sample source code about how to use the Quotek's quandl client.

  .. code-block:: c++

    #include <quotek/quotek.hpp>
    #include <quotek/datasources/quandl.hpp>
    using namespace quotek::datasource;
    using namespace quotek::data;

    int main(int argc, char** argv) {

      //creates a new quandl object
      quandl qc("my-ApI-kEy");

      /*fetches weekly aggregated values for the Facebook stock and 
        stores it in a quotek::data::records container. */
      records recs = qc.query_values("WIKI","FB","weekly");
      return 0;
    }
