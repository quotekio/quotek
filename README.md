Quotek is a free Algotrading software, created to handle every aspects of such activity. 


Main Features
-------------

  * C++ algotrading engine with SDK, allowing to create diverse and smart trading stratégies.
  * Embedded Development environement, including:
       * An online code editor.
       * An online backtester.
       * GIT versionning.
  * Can Run concurrent strategies in realtime (multimodel).
  * Display of market charts in realtime (visualize module).


What do i need to use it ?
--------------------------

  * A fresh Linux Ubuntu 16.04+ install with git (1)
  * An IG Markets Broker API account (available at http://ig.com).
  * Some C++ programming skills are a plus.

(1) Debian stretch probably works too, though it was never tested.

How to Install
--------------

From your server's prompt (as root/sudo) type the follwing commands:

```
git clone https://github.com/quotekio/quotek
cd quotek
./build.sh all
```

At some point the installer will ask you to provide your server's hostname. This is absolutely necessary, so if you don't have one just use the reverse dns of the server's ip or create an entry in your hosts file.

That will be all for now..The full install process takes from 10 to 15mins.

How to Configure
-----------------

Now you can connect to the Quotek Interface with your web browser, at http://your.server.hostname (or IP). 
In order to login, use the following credentials: **Admin/Admin**

### Broker Interface


The first thing to configure is your IG API Account. To do that, go to Configuration => Broker, then click on the "+" button at the top-right of the screen.

A Modal window should appear. Give the broker config a name (without spaces) then enter the username, password and API key provided by IG, and finally click on "Create".

The second step is to add this newly created broker to you main config. To do that, go back in Configuration, click on the "Default" line, then "Edit". A Modal windows should open, then in the General tab select your previously configured broker in the Brokers Combo Box. Finally click on Modify, you're done.


Start the engine
----------------

Once eveything is properly configured, you can start the trading bot by clicking on the "Play" Button, at the top-center of the screen. 

If you don't see anything happen, you can troubleshoot by:

  * Checking the strategy compilation errors.
  * Trying to start the engine manually, by running ```/etc/init.d/quotek startfg``` from the server's command prompt.


How to Write Trading Strategies
-------------------------------

In order to write a new strategy, go to Strategies, then click on the "+" button at the top right of the screen. A code editor should open, then you can start writing your code. The initial code looks like this:

```
class newstrat: public strategy {
  public:

    quotek::broker* br0;
                  
    int initialize() {

      //put your init code here

      br0 = new quotek::broker(this);
      return 0;

    }

    void evaluate() {

      //put your evaluation code here

    }
};
```

Each strategy must be contained in a specific class inheriting from the strategy class. 

Here are some basic principles to keep in mind:

  1. initialize() is run every time the strategy is instanciated.
  2. evaluate() is run at every market data tick, this is mainly where you put your algo. 
  3. br0 is the broker object handler, through it you take and close positions.
  4. if you dont want to run evaluate on every tick, you can create a counter property and exec the code inside for some counter value.

To know which functions/analysis you can directly use in your strategies, i suggest you to read the SDK Documentation (available in sdk_doc of the following repository)


DISCLAIMER
----------

As stated in the project's software license (3-clauses BSD), the software's author can never and in any circumstance, be held responsible for any bug or software defect that would have resulted in any form of damages, including but not restricted to financial losses.


