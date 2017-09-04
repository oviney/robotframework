# robotframework
The purpose of this repo is to share the code I wrote to learn Robot Framework.

# Sample 1
The purpose of this sample project is to show how you can test UI/UX, REST & SOAP web services using extra libraries (additional to standard Robot Framework).

The UI/UX sample test shows you how to use Selenium2Library for some rudimentary Web browser operations.  This sample project shows you how to login to a wordpress blog site.  Each
step is validated by using a "wait..." keyword.  There are some basic examples of using css selectors (not the best CSS syntax - I will cover that in another tutorial!).

pip install selenium2library

The SOAP sample test shows you how to use the SudsLibrary to communicate with a SOAP webservice.  This sample project uses an external, public facing and available SOAP webservice.

pip install robotframework-sudslibrary

The REST sample test shows you how to use the RequestsLibrary, Collections and HTTPLibrary (https://github.com/peritus/robotframework-httplibrary) to communicate with a REST service.  The sample project uses an external, public facing and available REST webservice.

pip install robotframework-httplibrary
pip install robotframework-requests

# Useful hints
Git cheatsheet - https://www.git-tower.com/blog/git-cheat-sheet/