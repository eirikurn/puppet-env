class vim {
  $vim = $operatingsystem ? {
    darwin  => mvim,
    ubuntu  => vim-gnome,
    default => vim,
  }
  package { $vim:
    ensure => installed,
  }
  file { "/home/${id}/.vimrc":
    source => "puppet:///modules/vim/vimrc",
  }
}
