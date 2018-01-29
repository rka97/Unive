SM4 - Intro To Database Systems - Unive

Ahmad Khaled 103
Ahmad Essam  107
Israa Ashraf 111
Omnia Zakaria 113

To use the code:
install rails on windows or linux (the operating systems we tested), run bundle install, then db:setup and open the server using rails server. The website will then be on localhost:3000

To use the database:
The database can be opened by DB Browser for SQLite (a very lightweight program, no more than 15 megabytes in all) because we used SQLite on developing it. The exported database sql file is attached as well, but we have not tested it with another database engine. The "migrations" folder contains the scripts that were used in constructing the database. They're written in Rails' ActiveRecord syntax which is very much like traditional SQL with a few minor changes.