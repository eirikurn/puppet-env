node basenode {
  $dev_user = eirikur
  $dev_email = "eirikur@nilsson.is"
}

node default inherits basenode {
  include general
  include role_developer
}

