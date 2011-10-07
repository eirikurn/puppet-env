class general {
}

class role_developer {
  include vim
  class { 'vim::config': user      => $dev_user }
  class { developer: config_user => $dev_user }
}

