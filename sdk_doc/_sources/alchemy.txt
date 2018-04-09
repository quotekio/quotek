Alchemy API
===========

.. image:: _static/img/alchemy-logo.png
    :align: left
    :width: 200px
    :class: qimg
    :alt: Alchemy API service Logo.
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

You will find below the documentation of the Quotek Alchemy API client. With it you will be able to 
perform on text content advanced sentiment analysis, categorization or relations finding, these tools being the key factors for accurately analysing financial news. You can register for a free API key at the following URL: http://www.alchemyapi.com/api/register.html

|
|

.. doxygenclass:: quotek::nlp::alchemy
  :members:
  :protected-members:
  :private-members:


Example
-------

You will find below and sample source code about how to use the alchemy API client for sentiment
analysis.

  .. code-block:: c++

    #include <quotek/quotek.hpp>
    #include <quotek/alchemy.hpp>
    using namespace quotek::ml;

    int main(int argc, char** argv) {

      //we declare a text corpus for analysis

      std::string txt = "Before you knew it, it was an all-out Eastern USD reserve liquidation party, leading some to ask what effect the drawdowns would ultimately have on UST yields because all else equal, FX reserve selling is just QE in reverse.";

      //We create a new alchemy object
      alchemy al("JSKJS-09304832-SJ0390S");

      //We ask Alchemy API an sentiment analysis on text txt
      sentiment sent = al.sentiment(txt,"text");
    
      //We display sentiment on standard output.
      std::cout << "TEXT SENTIMENT:" << sent.sentimentstr << std::endl;

    }