Records
=======

.. doxygenclass:: quotek::data::records
  :members:
  :protected-members:
  :private-members:

Example
-------

The code below will show you how to manipulate records containers to store and 
retrieve time-series data.

.. code-block:: c++

  #include <quotek/record.hpp>
  #include <iostream>

  using namespace quotek::data;

  int main() {

    //First we create a vector of float values as fake data.
    std::vector<float> vals = { 4530, 4575, 4890, 4235, 4144, 4356, 4588, 4720, 4989 };

    //Then we can import these values inside a records container.
    records r1(vals);

    //We can iterate through this container with a simple loop:
    for (int i=0; i< r1.size(); i++  ) {

      //we assign a fake timestamp and spread value to record at position i
      r1[i].timestamp = time(0);
      r1[i].spread = 0;

      //Prints the value of record at position i
      std::cout << r1[i].value << std::endl;

    }

    //To append some data in the container, you must use the append() function:
    r1.append(time(0),4794,0);

    //Also works, it will not assign any value to timestamp and spread for the newly added record.
    r1.append(4794);

    //Alternatively you can create a record object then append it to the container:
    record trec;
    trec.timestamp = time(0);
    trec.value = 4794;
    trec.spread = 0;
    r1.append(trec);

  }




