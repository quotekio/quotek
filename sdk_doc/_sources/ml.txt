Machine Learning
================

.. image:: _static/img/bot.png
    :align: left
    :width: 200px
    :class: qimg
    :alt: ML Bot

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

The following section describes the capabilities of Quotek when it comes to Machine learning.
As we noticed in preamble, so far this is not very exhaustive but you can rest assured that it will grow 
in a significant way for the next versions of the SDK.

Note: For its underlying linear algebra operations, Quotek Machine Leaning functions make use of `Eigen C++ <http://eigen.tuxfamily.org/>`_ . Consequently, Some structures involved in Eigen like Eigen::MatrixXd or Eigen::VectorXd are used to store and retrieve data. For your convinence, and to make things as seamless as possible, these 2 types have aliases in the quotek SDK, which are respectively quotek::ml::dataset and quotek::ml::dvector.

Nevertheless if you need more informations about the Eigen Linear Algebra library, or just want to fulfill your curiousity, you can go to 
`http://eigen.tuxfamily.org/dox/ <http://eigen.tuxfamily.org/dox/>`_


Machine Learning Table of Content
---------------------------------

.. toctree::

   ml_linreg
   ml_logreg
   ml_utils
   
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
|
|
|
|
