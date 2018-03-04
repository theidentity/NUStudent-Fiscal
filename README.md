# NU$tudent Fiscal #
## Inteligent Budget Estimation ##
---

NU$tudent Fiscal is a Rule Based systems which estimates the living expenses for foreign students in NUS and provides suggestions to them.

### How to run the program

1. Start the Webapp

```
python2 app.py
```
This opens the app in the default port 5000.
Inorder to specify on which port to open the app, specify this as a command line argument.
```
python2 app.py 5678
```

2. In the browser open the following address or the address you specified
```
http://localhost:5000/
```

### Things to note

1. Use the restart button on the program to start again - do not manually refresh or try to go back during the execution of the program
2. If you get an address conflict you will get the following : 
```
error: [Errno 98] Address already in use
```
In this case, specify a free port as commang line argument
