node default {
  $package_to_work_on= ['apache2','nginx']

    package{$package_to_work_on:
      ensure => purged

      $packages_to_install= ['apache2','nginx','mysql-server']
        ensure => installed
    }
}
