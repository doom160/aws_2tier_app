Node.js Docker Image simple CRUD
========

Simple Node.js ExpressJS app that performs basic CRUD. This app is wired to Github workflow.

## Pre-requisite

1. Creating database and table
```
create database test;

use test;

CREATE TABLE users (
id int(11) NOT NULL auto_increment,
name varchar(100) NOT NULL,
age int(3) NOT NULL,
email varchar(100) NOT NULL,
PRIMARY KEY (id)
);
```


