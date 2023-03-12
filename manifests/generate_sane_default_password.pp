# intended to manage a file on PE infra servers to use with 
# Puppet's generate command to create sane default passwords
class utils::generate_sane_default_password {
  file { '/opt/puppetlabs/generate_sane_default_password.sh':
    ensure  => file,
    owner   => 'pe-puppet',
    group   => 'pe-puppet',
    mode    => '0755',
    content => '#!/bin/sh
LENGTH=$1
if [ "$LENGTH" == "" ]; then LENGTH=32; fi
</dev/urandom tr -cd "[:graph:]" | head -c$LENGTH; echo ""
',
  }
}
