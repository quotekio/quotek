Extras
======

.. image:: _static/img/toy.png
    :align: left
    :width: 150px
    :class: qimg
    :alt: Extras image
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


In this section you will find the documentation for everything that is not directly related to 
algotrading but that is also offered by the Quotek SDK.


Time Functions
--------------

| As the name suggests, these are all the function related to the manipulation of time data.
| 
| Note about time functions: For most of them, user has to provide the current 
| timestamp instead of just having an internal time(0) call inside. It is because these functions
| must support backtesting, which implies decorelated real time and backtest time.
| 
| 
| SaaS Users: To use these functions, all you have to do is to call them this->t as timestamp argument, eg: is_time("10:00", this->t);
|
|

.. doxygenfunction:: quotek::core::time::timestr
.. doxygenfunction:: quotek::core::time::timeint
.. doxygenfunction:: quotek::core::time::is_time
.. doxygenfunction:: quotek::core::time::week_day
.. doxygenfunction:: quotek::core::time::month_day
.. doxygenfunction:: quotek::core::time::datestr


String Functions
----------------

String functions are extending the set of C++ string manipulators, So that the users of the Quotek SDK doesn't have to code them.

.. doxygenfunction:: quotek::core::utils::split(const std::string&, char)
.. doxygenfunction:: quotek::core::utils::tokenise
.. doxygenfunction:: quotek::core::utils::ltrim
.. doxygenfunction:: quotek::core::utils::rtrim
.. doxygenfunction:: quotek::core::utils::trim


HTTP
----

The HTTP Class allows the users of the Quotek SDK to perform raw HTTP queries and fetch their result.

.. doxygenclass:: quotek::http
  :members:
  :protected-members:
  :private-members:
 
|
|
|
|
