Description
===========
Setup high density selenium grid for linux node, supports opera/chrome/firefox/phantomjs instances.

Requirements
============

## Platform:
* Ubuntu
* Debian

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

* selenium::hub
* selenium::node
* selenium::phantomjs
