$vimPackage = $operatingsystem ? {
  darwin  => mvim,
  ubuntu  => vim-gnome,
  default => vim,
}

class vim {
  package { $vimPackage:
    name   => vim,
    ensure => installed,
  }
}

class vim::config ( $user ) {
  file { "/home/$user/.vimrc":
    content => template("vim/vimrc"),
    owner   => $user,
    group   => $user,
    require => Package[vim],
  }

  # Ignore git files for following copies
  File { ignore => '.git' }

  file { "/home/$user/.vim/autoload":
    source => "puppet:///modules/vim/autoload",
    recurse => true,
    mode => 644,
    require => File["/home/$user/.vimrc"],
  }

  file { "/home/$user/.vim/bundle":
    source => "puppet:///modules/vim/bundle",
    recurse => true,
    mode => 644,
    require => File["/home/$user/.vimrc"],
  }
}
