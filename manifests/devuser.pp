$username = eirikur

class { "vim": }
class { "vim::config": user => $username }

class { "zsh": }
class { "zsh::config": user => $username }

user { $username:
  ensure     => present,
  home       => "/home/$username",
  managehome => true,
  shell      => "/bin/zsh",
  require    => Package["zsh"],
}

