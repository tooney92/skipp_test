# README

* Ruby version: ruby "3.0.2".

* Rails version: "~> 7.0.4".

* Database: Postgresql.


# How to run the app

* 1.) Run "bin/setup" sets up the application, creates the DB and runs the necessary migrations.

* 2.) Run "bin/ci" runs the test suites or simply running "rspec".

* 3.) Run "bin/run" starts the application.


# Routes

Endpoints documented on postman.

API docs https://documenter.getpostman.com/view/9973912/2s83zgsPw3

# Notes

* Exchange rate: 
  * The Euro was used as the base currency.
  * Rates gotten on 22-10-07 from https://www.xe.com/currencyconverter/
  * Rate as at the time of the project:
    * "EUR" => "USD", 0.97984085
    * "EUR" => "GBP", 0.878101
    * "EUR" => "JOD", 0.694811
    * "EUR" => "JPY", 142.073

