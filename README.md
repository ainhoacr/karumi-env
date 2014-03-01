karumi-env
==========

A modern setup for your Python Elastic Beanstalk Environment

Setup for Amazon Linux adding feature to the standard Elastic Beanstalk Environment.

This Repository contains a puppet bootstrap and a puppet manifest that install the modification of the standard setup.

List of available complement
-----------------------------

* Sass(http://sass-lang.com/) is a CSS extension language.
* yUglify(https://github.com/yui/yuglify) is a wrapper around UglifyJS and cssmin with the default YUI configurations on each of them.
* libxml2 and libxslt as requirements for lxml(http://lxml.de/).
* libmemcached, zlib, cyrus-sasl-lib as requirements for pylibmc(http://sendapatch.se/projects/pylibmc/)

List of modification of the standard configuration
------------------------------------

* Activate deflate(compressed output) config for non-binary files
* Activate explicit expire headers
* HTTP authorisation headers are passed through to a WSGI