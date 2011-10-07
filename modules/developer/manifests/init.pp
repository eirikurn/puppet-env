class developer($config_user = undef) {
  include developer::git
  include developer::zsh

  if $config_user {
    class { "developer::git::config": user => $config_user }
    class { "developer::zsh::config": user => $config_user }
  }
}

class developer::git {
  package { "git":
    ensure => installed,
  }
}

class developer::git::config ($user) {
  file { "/home/$user/.gitconfig":
    content => template("developer/gitconfig"),
    owner   => $user,
    group   => $user,
    require => Package["git"]
  }
}

class developer::zsh {
  package { "zsh":
    ensure => installed,
  }
}

class developer::zsh::config ($user) {

  # Ignore git files for following copies
  File { ignore => '.git' }

  file { "/home/$user/.zshrc":
    content => template("developer/zshrc"),
    owner   => $user,
    group   => $user,
    require => Package["zsh"],
  }

  file { "/home/$user/.oh-my-zsh":
    source  => "puppet:///modules/developer/oh-my-zsh",
    recurse => true,
    mode    => 644,
    require => File["/home/$user/.zshrc"],
  }
}
