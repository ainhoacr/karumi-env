Exec {
 path => [
 '/usr/local/bin',
 '/opt/local/bin',
 '/usr/bin',
 '/usr/sbin',
 '/bin',
 '/sbin'],
}

class karumi::server{

  #essentials
  case $operatingsystem {
    # Note that these matches are case-insensitive.
    centos: {
      $gcc44_version = "4.4.7-4.el6"
      $apache_version = "2.2.15-29.el6.centos"
      $mysqldevel_version = "5.1.73-3.el6_5"
      $mod_wsgi_version = "3.2-3.el6"
      $mysql_version = "5.1.73-3.el6_5"
    }
    amazon: {
      $gcc44_version = "4.4.6-4.81.amzn1"
      $apache_version = "2.2.25-1.0.amzn1"
      $mysqldevel_version = "5.5-1.3.amzn1"
      $mod_wsgi_version = "3.2-3.7.amzn1"
      $mysql_version = "5.5-1.3.amzn1"
    }
    default: { fail("Unrecognized operating") }
  }
  package {'httpd':
    ensure => $apache_version,
  }

  package {'mod_wsgi':
    ensure => $mod_wsgi_version,
    require => Package["httpd"],
  }

  package {'mysql':
    ensure => $mysql_version,
  }

  package {'mysql-devel':
    ensure => $mysqldevel_version,
    require => Package["mysql"],
  }

  #python
  class { 'python':
    dev        => true,
    pip        => true,
    virtualenv => true,
  }

  #sass
  package { 'sass':
    ensure   => 'installed',
    provider => 'gem',
  }

  include nodejs

  exec { 'npm strict-ssl':
    command => "npm config set strict-ssl false --global",
    before => Package["yuglify"]
  }

  package { 'yuglify':
    ensure   => 'installed',
    provider => 'npm',
    require => Class["nodejs"],
  }

  package { ['libxml2-devel', 'libxslt-devel']:
    ensure   => 'installed',
  }

  service { "httpd":
      ensure  => "running",
      enable  => "true",
      require => Package["httpd"],
  }

  # add a notify to the file resource
  exec { "deflate":
      command => "cp files/deflate.conf /etc/httpd/conf.d/",
      notify  => Service["httpd"],  # this sets up the relationship
      require => Package["httpd"],
  }

  exec { "expire":
      command => "cp files/expires.conf /etc/httpd/conf.d/",
      notify  => Service["httpd"],  # this sets up the relationship
      require => Package["httpd"],
  }

  exec { "wsgi_ext":
      command => "cp files/wsgi_ext.conf /etc/httpd/conf.d/",
      notify  => Service["httpd"],  # this sets up the relationship
      require => Package["httpd"],
  }

  package {  "libmemcached-devel":
    ensure   => 'installed',
  }

  package {  "zlib":
    ensure   => 'installed',
  }

  package {  "cyrus-sasl-lib":
    ensure   => 'installed',
  }

}

include karumi::server