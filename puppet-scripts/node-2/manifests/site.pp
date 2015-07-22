include java
include git

# need to disable so host can access guest machine
package { "firewalld":
  ensure => "purged",
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ], user => "vagrant", logoutput => true, }
Package { allow_virtual => false }

Class ['java'] -> Class ['git'] 
