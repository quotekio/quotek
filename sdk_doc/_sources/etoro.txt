eToro 
=====

.. image:: _static/img/etoro-logo.png
    :align: left
    :width: 100px
    :class: qimg
    :alt: eToro Logo
|
|
|
|
|
|
|
|
|
The following section is the documentation of the Quotek SDK eToro OpenBook API Client. 

eToro is the biggest social trading platform, and this client will allow you to enrich your trading algorithms with copy-trade functionalities. 

You can for instance fetch the list of the most successul traders on the platform and get their open positions to correlate them with your own trading signals and indicators.

The eToro Client is also able to give you the market sentiment of the traders on the platform for a large amount of assets, using the insight() function.


.. doxygenclass:: quotek::datasource::etoro
  :members:
  :protected-members:
  :private-members:


.. doxygenclass:: quotek::datasource::eto_user
  :members:
  :protected-members:
  :private-members:


Example
-------

You will find below and sample source code about how to use the Quotek's eToro OpenBook client.

  .. code-block:: c++

    #include <quotek/quotek.hpp>
    #include <quotek/datasources/etoro.hpp>
    using namespace quotek::datasource;
    using namespace quotek::data;

    int main(int argc, char** argv) {

      //creates a new etoro object
      etoro et1;

      /* Fetches the list of the most succesful traders for the last 
      30 days and which use medium risk strategies. */
      std::vector<eto_user> e_users = et1.ranking(30, "Medium","Gain");

      /* Then prints their respective usernames and gains */
      for (int i=0;i< e_users.size(); i++) {
        std::cout << e_users[i].username << std::endl;
        std::cout << e_users[i].gain << std::endl;
      }

      /* Now we will get the trader's insight for the Gold asset. */
      std::vector<float> gsent = et1.insight("Gold","commodities");
      std::cout << "GOLD LONG/SHORT RATIO:" << gsent[0] << "/" << gsent[1];
      
    }
