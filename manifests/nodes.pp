node basenode {
  $user = eirikur
}

node 'eirikur-VirtualBox' inherits basenode {
  include general
  include developer
  include role_borgaserver
}

node default {
  include general
  include developer
}

