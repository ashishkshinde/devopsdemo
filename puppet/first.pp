node default{
  package { 'nginx':
    ensure => installed,
  }
  file{'/tmp/status.txt':
    content => "nginx installed",
    mode    => '0644',
  }
}
