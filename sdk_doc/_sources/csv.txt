CSV Importer
============

.. doxygenclass:: quotek::datasource::csv
  :members:
  :protected-members:
  :private-members:


Example
-------

In the following example, we will assume that we have a csv file called "dow_values.csv" with the following content:

| #DATE, #CLOSING_VALUE
| 2016-08-01, 17590.1
| 2016-08-02, 17640.5
| 2016-08-03, 17610.2
| 2016-08-04, 17580.7

.. code-block:: c++

  #include <quotek/quotek.hpp>
  #include <quotek/datasources/csv.hpp>
  using namespace quotek::datasource;
  using namespace quotek::data;

  int main(int argc, char** argv) {
  
    //We declare a new csv object.
    csv csv1("file://./dow_values.csv",',');

    //We skip the first header line.
    csv1.setOffset(1);

    //We import the four lines of data using column 1 of the csv file
    records r1_dow = csv1.import_records(4,1);

    //We check that we got some data in r1_dow.
    assert( r1_dow.size() > 0 );

    //We check that it did import the correct data
    std::cout << "DOW FIRSTVAL:" << r1_dow[0].value << std::endl;

  }

|
|
|
|



