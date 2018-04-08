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
That's all..The full install process takes from 10 to 30mins depending on the performance of the server.

**Note: Don't forget to note the DB PASSWORD provided at the end of the install, you will need it later !**


How to Configure
-----------------

Now you can connect to the Quotek Interface with your web browser, at http://your.server.hostname (or IP). 
In order to login, use the following credentials: **Admin/Admin**

### Broker Interface


The first thing to configure is your IG API Account. To do that, go to Configuration => Broker, then click on the "+" button at the top-right of the screen.

A Modal window should appear. Give the broker config a name (without spaces) then enter the username, password and API key provided by IG, and finally click on "Create".

The second step is to add this newly created broker to you main config. To do that, go back in Configuration, click on the "Default" line, then "Edit". A Modal windows should open, then in the General tab select your previously configured broker in the Brokers Combo Box. Finally click on Modify, you're done.


### Backend DB Password


Now it's time to set the Backend's DB password. 
To do that, just go back in configuration, click on the "Default" line then "Edit". Once the modal windows is opened, click on the "Backend" tab, then change the Backend Password to be the one provided at the Install Step. To finish, click on Modify


Start the engine
----------------

Once eveything is properly configured, you can start the trading bot by clicking on the "Play" Button, at the top-center of the screen. 

If you don't see anything happen, you can troubleshoot by:

  * Checking the strategy compilation errors.
  * Trying to start the engine manually, by running ```/etc/init.d/quotek startfg``` from the server's command prompt.


DISCLAIMER
----------

As stated in the project's software license (3-clauses BSD), the software's author can never and in any circumstance, be held responsible for any bug or software defect that would have resulted in any form of damages, including but not restricted to financial losses.













