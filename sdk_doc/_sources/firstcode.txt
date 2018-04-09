Hello World
============

The following section will get you started width the Quotek SDK with a very simple code, 
Which will print a string along with the SDK version. This will both make a first contact with the SDK, and 
also ensure that your toolchain is working correctly with our SDK.

Let's begin
-----------

Ok, so to start we will need to include the main quotek header:

.. code-block:: c++

  #include <quotek/quotek.hpp>

Next, we will write the main function that will print the SDK version, with the help of quotek::core::version().

.. code-block:: c++

  int main(int argc, char** argv) {
    std::cout << "Hello World, version is :" << quotek::core::version() << std::endl;
  }


Full Code
---------

.. code-block:: c++

  //File hello.cpp
  #include <quotek/quotek.hpp>

  int main(int argc, char** argv) {
    std::cout << "Hello World, Version is: " << quotek::core::version() << std::endl;
  }


Compilation
-----------

Now let's try to compile this. If You're using linux, remember that the correct call to the compilation toolchain is the following:

``g++ -std=c++11 -I/opt/quotek/include -L/opt/quotek/lib -o hello_world hello.cpp -lpthread -lquotek -lcurl``

Otherwise, just use the 'Compile' fnction of your IDE.


Execution
---------

Then if you run the freshly compiled binary, you should see the following output:

``Hello World, version is: Quotek SDK v3.0``

|
|
|
|











