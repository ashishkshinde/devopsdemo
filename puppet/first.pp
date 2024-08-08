node default{
  package{'nginx':
    ensure => installed,
  }
  package{'apache2'
    ensure => installed,
  }

  file{'/tmp/status.txt':
    content => "nginx installed \n installed apache successfully\n",
    mode    => '0644',
  }
}
