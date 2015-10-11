# SessionAnalytics
This needs sqllite3 to run. Make sure you have sqllite3 on your path `/usr/bin/sqlite3`. Go to sql folder in this project and run the command below: `sqlite3 sessions.db`.  At the julia prompt, You may then want to run `createSchemaAndInitialData("sessions.db")` to create database and tables.

To Run this application:
* Move to src/ui, run `escher --serve`

In a Julia REPL, run:

* `Pkg.add("Escher")`
You might want to link escher executable to /usr/local/bin or somewhere in your PATH:

* `ln -s ~/.julia/v0.4/Escher/bin/escher /usr/local/bin/`
