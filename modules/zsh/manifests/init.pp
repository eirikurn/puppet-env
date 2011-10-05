class zsh {
  package { "zsh":
    ensure => installed,
  }
}

class zsh::config ( $user ) {
  file { "/home/$user/.zshrc":
    content => template("zsh/zshrc"),
    owner   => $user,
    group   => $user,
    require => Package["zsh"],
  }

  # Ignore git files for following copies
  File { ignore => '.git' }

  file { "/home/$user/.oh-my-zsh":
    source  => "puppet:///modules/zsh/oh-my-zsh",
    recurse => true,
    mode    => 644,
    require => File["/home/$user/.zshrc"],
  }
}
