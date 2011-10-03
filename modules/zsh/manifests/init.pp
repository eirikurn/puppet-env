class zsh {
  package { "zsh":
    ensure => installed,
  }
}

class zsh::config ( $user ) {
  file { "/home/$user/.zshrc":
    source => "puppet:///modules/zsh/oh-my-zsh/templates/zshrc.zsh-template",
    owner   => $user,
    group   => $user,
    require => Package["zsh"],
  }

  file { "/home/$user/.oh-my-zsh":
    source  => "puppet:///modules/zsh/oh-my-zsh",
    recurse => true,
    mode    => 644,
    require => File["/home/$user/.zshrc"],
  }
}
