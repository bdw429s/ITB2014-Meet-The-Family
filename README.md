ITB2014-Meet-The-Family
=======================

Sample app for Into The Box 2014 "Meet The Family".  The presentation showed how esay it was to take a legacy CFML app and add each of the Box libraries to it.


The master branch contains the legacy app in its original form.  To run it locally set up a mySQL database using the SQL dump in the workbench folder.

To see the addition of Box libraries, switch to each branch in this order:
* TestBox 
* WireBox
* CacheBox
* LogBox

Each branch contains the changes from the prior branches so once you get to LogBox, the application will be fully converted over to using each Box library. To run the unit tests, navigate to the /tests folder.
