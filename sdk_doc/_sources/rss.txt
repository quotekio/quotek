RSS Feeds
=========

.. doxygenclass:: quotek::datasource::rss
  :members:
  :protected-members:
  :private-members:

Example
-------

You will find below a sample source code about how to use the Quotek RSS client to fetch
news from wall-street journal Market RSS feed */

  .. code-block:: c++

    #include <quotek/quotek.hpp>
    #include <quotek/datasources/rss.hpp>
    #include <iostream>
    using namespace quotek::datasource;
    using namespace quotek::data;

    int main(int argc, char** argv) {

      //We declare a new rss client.
      rss r1("http://www.wsj.com/xml/rss/3_7031.xml");

      //we fetch the last five news of the feed.
      std::vector<news> nvect = r1.fetch(5);

      //Then we iterate through them to display their content on stdout.
      for(int i=0;i<nvect.size();i++) {
        std::cout << nvect[i].content << std::endl;
      }

    }

  