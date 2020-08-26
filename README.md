# Qt/QML/C++ integration example

In this project I would like to build a boilerplate for a code
that accomplishes following:

* Crossplatform app with GUI
    * Tested:
        * [x] Linux
        * [ ] Windows
        * [ ] macOS
        * [ ] Android
        * [ ] iOS
    * Build, install and run process documented:
        * [ ] Linux
        * [ ] Windows
        * [ ] macOS
        * [ ] Android
        * [ ] iOS

* [x] UI is implemented in QML

* [ ] There is a list of items
    * e.g. fruit with properties of name and price

* [ ] An item is implemented in C++ and is not dependent on QML UI
    * e.g. it is a plain C++ object or Q_OBJECT (preferably plain
      C++ object with Q_OBJECT interface to QML)

* [ ] List of item is dynamic
    * Items can be added, removed and modified from UI

* [ ] C++ code is aware of dynamic collection of items
    * It can e.g. randomly adjust price of every item independent of UI
