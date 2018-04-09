Install
=======

Using Quotek SDK in your C++ code is fairy easy, since it only consists of a library and header files.
Please note that if you're using our Quotek SaaS solution, this section doesn't concern 
you because everything is already setup for you inside your server environment.

Windows Install
---------------

.. image:: _static/img/windows.png
    :align: left
    :width: 120px
    :class: qimg
    :alt: Windows Logo.

|
|
|
|
|
|
|
|

Download and unzip the quotek SDK archive file. Then right-click on the "installer_win64.bat" script
file which is located at the root of the decompressed directory, then finally click on "Run as Administrator". The SDK will be installed in 
**C:\\Program Files\\quotek\\sdk**, and ready to go.

Visual Studio Setup
^^^^^^^^^^^^^^^^^^^
.. image:: _static/img/vstudio.png
    :align: left
    :width: 80px
    :class: qimg
    :alt: MSVC Logo.
|
|
|
|
|
|

Just go to **C:\\Program Files\\quotek\\sdk\\helpers\\vstudio**, 
then double click on the "Quotek.vsix" file. The SDK should now be installed with Visual Studio.
If you start a new Project and go to "Visual C++" , you will see Quotek Project. Then Select it and
start a new project: It's all good, you are now ready to code with quotek.

Linux Install
-------------

.. image:: _static/img/linux.png
    :align: left
    :width: 120px
    :class: qimg
    :alt: Linux Logo.

|
|
|
|
|
|
|
|

Download and unzip the quotek SDK archive file, and launch the "installer_linux.sh" script 
located at the root of the decompressed directory. All of the Quotek SDK will then be installed 
in /opt/quotek/sdk. The libraries are located in **/opt/quotek/sdk/lib** and headers are in **/opt/quotek/sdk/include**.

Dependencies
^^^^^^^^^^^^

În order to work properly on Linux, Quotek SDK needs libcurl as a dependency. This is
a very common package which is probably already installed on your system. In any case,
the install procedure for libcurl is as follow:

**For Debian/Ubuntu**

``sudo apt-get install libcurl4-openssl-dev``

**For CentOS/Fedora**

``sudo yum install libcurl-devel``

Building & Linking
^^^^^^^^^^^^^^^^^^

Given that the headers and libraries are not installed at the usual places in the system, you will need to 
add a few arguments to your compilation line. Also, because libquotek needs them, you will need to link the programs you code with libcurl and pthread.

So the typical compilation line of a program using quotek SDK on Linux is the following:

``g++ -std=c++11 -I/opt/quotek/include -L/opt/quotek/lib -o <YOUR_PROGRAM> <YOUR_C++_FILE> -lpthread -lcurl -lquotek``

|
|
|
|
