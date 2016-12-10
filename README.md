# _Hair Salon_

#### _SQL Database Driven Administrative Hair Salon App, Dec. 9th, 2016_

#### By _**Adam Zinder**_

## Description

_Uses a SQL database to collect user inputted information on stylists and clients as well as allowing updating and deleting features_

## Setup/Installation Requirements

* _$ git clone https://github.com/azinder1/hair-salon_
* _$ cd hair-salon_
* _$ postgres_
* _$ psql_
* _$ bundle_
* _$ psql (in a separate tab)_
  * _=# CREATE DATABASE hair_salon;_
  * _=# \c hair_salon;_
  * _=# CREATE TABLE clients(id serial PRIMARY KEY, name varchar, contact_number varchar, gender varchar, stylist_id int);_
  * _=# CREATE TABLE stylists(id serial PRIMARY KEY, name varchar);_
  * _=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon__
* _$ ruby app.rb_
* _open a browser with url localhost:4567/_

## Known Bugs
_None_

## Support and contact details

https://github.com/azinder1

## Technologies Used

_Ruby, SQL, Postgres, Bootstrap for CSS_

### License

*MIT*

Copyright (c) 2016 **_Adam Zinder_**
