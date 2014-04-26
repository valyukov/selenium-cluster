[![Build Status](https://travis-ci.org/valyukov/selenium-cluster.svg?branch=master)](https://travis-ci.org/valyukov/selenium-cluster)

Description
===========
Setup high density selenium grid for linux node, supports opera/chrome/firefox/phantomjs instances.

Requirements
============

## Platform:
* Ubuntu 12.04
* Ubuntu 14.04

## Hardware:

cpu: 4 
memory: 8Gb

## Cookbook:

* ark
* phantomjs 
* google-chrome 
* apt 
* java 

Attributes
==========

See `attributes/default.rb` for default values.


Recipes
=======

* selenium-cluster::hub
* selenium-cluster::node
* selenium-cluster::phantomjs
