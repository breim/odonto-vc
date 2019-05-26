# Odonto-vc

[![TravisCI](https://travis-ci.org/breim/odonto-vc.svg?branch=master)](https://travis-ci.org/breim/odonto-vc)
[![Code Climate](https://codeclimate.com/github/breim/odonto-vc/badges/gpa.svg)](https://codeclimate.com/github/breim/odonto-vc)
[![Test Coverage](https://api.codeclimate.com/v1/badges/20afc48491663b9585c8/test_coverage)](https://codeclimate.com/github/breim/odonto-vc/test_coverage)

A small plataform to help dentists control your bussines.


⚠️🚧
This is a product in development and does not represent the final version.
 

### Run it 

Clone repo

```
git clone https://github.com/breim/odonto-vc
```

Install dependencies

```
cd odonto-vc && bundle install
```

Configure your database and other env passwords( check example in: ***application.example.yml*** )

```
figaro install
```

Create database

```
rake db:migrate
```


🎉 Run rails server 🎉  

```
rails server
```
