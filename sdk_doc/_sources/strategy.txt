The Strategy Class
==================

In Quotek, the strategy class can be seen as a framework, a backbone on which you can build your trading algorithm. The strategy class mainly consists of a set of virtual members, which need to be reimplemented by the user to effectively create an algotrading system.


How to use it ?
---------------

As you will see, the two main steps for using the strategy class in your own algos, 
are first to reimpement the needed virtual classes, and second to interface the strategy class with the real world (market datastream, brokerage, etc..).


Important Class methods
-----------------------

In order to perform the two steps we described erlier, you have to know which are the most important attributes of the strategy class. These are the following:

int initialize()
^^^^^^^^^^^^^^^^

This method is for initializing your algorithm. Every component of your algorithm that needs to be initialized once at the beginning, can
be so in this function.

void evaluate()
^^^^^^^^^^^^^^^

Probaly the most important method of all, this is where your main algorithm logics must go. The goal of evaluate() is to be called many times ( up to 1 time per price move, if you want ), so that you can take one or more dicisions according to the prices
evolution.

order(string order)
^^^^^^^^^^^^^^^^^^^

The strategy class has its own thread-safe FIFO queue, to store and process the buy/sell orders that will be passed to your borker afterwards. What orders() does is that it simply pushes the order string passed as argument inside the FIFO, that's it.


void set_env()
^^^^^^^^^^^^^

Also important, the purpose of this function is to interface the strategy class with the external world ( prices streams, brokers, etc.. )
it takes 4 elements as arugments but for this introduction only one is important: records *recs (The others can be set to NULL).

Important Class variables
-------------------------

t
^
strategy.t is stores the epoch timestamp at which the algo is running . If the algo is live, then strategy.t might be equal to time(0)

value
^^^^^
strategy.value stores the price at time t of the asset you are working with in your algo.


Example
-------

Now let's talk about an effective implementation. As explained, the first step is 
to declare a new class inheriting from the strategy class.

.. code-block:: c++

  #include <quotek/quotek.hpp>
  #include <quotek/strategy.hpp>
 
  using namespace quotek::data;

  //Here, we declare a new class inheriting from strategy
  class mystrat : public strategy {


Next, the goal will be to override the two main members of the class: initialize() and evaluate(). evaluate will contain your effetive algorithm.


.. code-block:: c++

    public:

      //We have nothing to init, so we keep it empty.
      int initialize() {
    
      }

      //We created a very trivial evaluation: 
      //If the AAPL stock price reaches $115, then buy 10 stocks.
      void evaluate() {

        if ( value  >= 115.0 ) {
          order("buy AAPL 10");
        }
      }
  };

Now that we have our inherited class that is implemented, we will want to interface it with the data and run it.

.. code-block:: c++

  int main(int argc, char** argv) {

    //This variable will store the current price of the asset we work with. 
    float fetched_value;

    std::string order;

    //We create a new instance of our custom class.
    mystrat s1;

    //We create a records container in order to store the price data.
    records *recs = new records();

    //We interface our records container with the strategy.
    s1.set_env(recs, NULL, NULL, NULL);

    //We call the initialize member
    s1.initialize();

    while(true) {

      //Place your market datastream fetching code here (data must be stored inside the fetched_value float variable)

      s1.t = time(0);
      s1.value = fetched_value;
      record r(s1.t, fetched_value, 0);
      recs->append(r);
      
      //We call the price evaluation method.
      s1.evaluate();

      while ( s1.orders_queue.pop(order, false)) {

        //place your broker orders passing code here

      }


    }

  }

Full Code
---------

.. code-block:: c++

  #include <quotek/quotek.hpp>
  #include <quotek/strategy.hpp>
  
  using namespace quotek::data;

  class mystrat : public strategy {

    public:

      int initialize() {
     
      }

      void evaluate() {

        if ( value  >= 115.0 ) {
          order("buy AAPL 10");
        }
      }
  
  };

  int main(int argc, char** argv) {

    float fetched_value;
    std::string order;
    mystrat s1;
    records *recs = new records();

    s1.set_env(recs, NULL, NULL, NULL);
    s1.initialize();

    while(true) {

      //Place your market datastream fetching code here (data must be stored inside the fetched_value float variable)

      s1.t = time(0);
      s1.value = fetched_value;
      record r(s1.t, fetched_value, 0);
      recs->append(r);
      
      s1.evaluate();

      while ( s1.orders_queue.pop(order, false)) {

         //place your broker orders passing code here

      }

    }

  }







