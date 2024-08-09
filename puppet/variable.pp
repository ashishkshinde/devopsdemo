node default{
  $text= "hello world, this is to test variable\n"
  file{'/tmp/test_vars.txt':
    content => $text,
    owner => ubuntu,
    group => ubuntu,
    mode    => '0644',
  }
}
