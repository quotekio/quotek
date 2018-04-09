Twitter
=======

.. doxygenclass:: quotek::datasource::twitter
  :members:
  :protected-members:
  :private-members:
  
Example
-------

You will find below a sample source code about how to use the Quotek Twitter client to fetch
the 40 most recent tweets containing the word "DOWJONES". */

  .. code-block:: c++

    #include <quotek/quotek.hpp>
    #include <quotek/datasources/twitter.hpp>
    #include <iostream>

    using namespace quotek::datasource;
    using namespace quotek::data;

    int main(int argc, char** argv) {

      //We declare a new Twitter client.
      twitter tw1("TWITTER-CONSUMER-KEY",
                  "TWITTER-CONSUMER-SECRET",
                  "TWITTER-TOKEN",
                  "TWITTER-TOKEN-SECRET");

      //we fetch the 40 most recent tweets matching "DOWJONES"
      std::vector<news> nvect = tw1.search("DOWJONES",40,"recent","en");

      //Then we iterate through them to display their content on stdout.
      for(int i=0;i<nvect.size();i++) {
        std::cout << nvect[i].content << std::endl;
      }

    }