karumi-env
==========

A modern setup for your Python Elastic Beanstalk Environment.

Sets up an Amazon Linux machine, adding essential features to the standard Elastic Beanstalk Environment.

This Repository contains a Puppet *bootstrap* and a Puppet *manifest* which install the modifications on the standard setup.

List of available complement
-----------------------------

* **[Sass](http://sass-lang.com/)**, a CSS extension language.
* **[yUglify](https://github.com/yui/yuglify)**, a wrapper around UglifyJS and cssmin with the default YUI configurations on each of them.
* **libxml2** and **libxslt**, as requirements for [lxml](http://lxml.de/).
* **libmemcached**, **zlib** and **cyrus-sasl-lib**, as requirements for [pylibmc](http://sendapatch.se/projects/pylibmc/).

List of modifications to the standard configuration
------------------------------------

* Activate deflate (compressed output) config for non-binary files.
* Activate explicit expire headers.
* HTTP authorisation headers are passed through to a WSGI.
