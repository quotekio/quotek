.. Quotek SDK documentation master file, created by
   sphinx-quickstart on Thu Aug  6 02:11:10 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to the Quotek SDK documentation!
========================================

Quotek SDK is a set of C++ classes and functions which aims to provide quants with the most useful functions,
to develop fast and efficient strategies in a short amount of time. 

What's in it ?
--------------

You'll find plenty of classes in this SDK, all of them serving multiple purposes. Beyond them you will find 
data source fetching classes, statistical analysis and financial modeling functions, machine learning service clients and algorithms, etc..

The scheme below shows the distribution of functionalities among the namespaces of the SDK: 

.. image:: _static/img/quotek_namespace.png
    :align: center
    :width: 600px
    :class: qimg
    :alt: Quotek SDK Namespace


.. toctree::
   :hidden:
   :includehidden:
   :titlesonly:

   start
   data_struct
   quant
   ta
   ml
   nlp
   data_sources
   broker
   extras
   samples

|
|
Now we'll make a short description of each important namespace and what they contain.

Core (quotek::core)
^^^^^^^^^^^^^^^^^^^

  Embedds the strategy and portfolio management classes, plus some extra non finance related functions like HTTP and client, JSON Parser, time data manipulation functions.. 

Qunatitative Analysis (quotek::quant)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 The most important category of all, it regroups all the classes and functions needed to process assets historical data from a quantitative perspective.

Data structures (quotek::data)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 This is a set of classes which are meant to store and manipulate structured data, and especially time-series ones.

Data Sources (quotek::datasource)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  quotek::datasource regroups all the classes which purpose is to fetch data from remote datasources.
  We can for instance think of Yahoo! finance historical data, RSS feeds, etc..

Machine Learning (quotek::ml)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  This namespace regroups all the classes and functions related to machine learning / deep learning.
  Since this aspect of algo-trading is really promising, expect it to be much deeper in the future.

Natural Language Processing (quotek::nlp)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  quotek::nlp gives the needed tools to perform Natural Language Processing on financial news/reports, etc..
  With these tools, you can classify text data, extract meaning, etc..

Broker Interractions (quotek::broker)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  The broker class is here to take care of the communication between your trading algo and your broker. This mainly allows to send position orders to your broker.
  
  Note about Broker Interractions: This class is really useful only when used in conjunction with Quotek SaaS.


