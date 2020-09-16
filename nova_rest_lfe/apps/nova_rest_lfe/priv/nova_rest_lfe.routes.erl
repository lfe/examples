#{prefix => "",
  security => false,
  routes => [
    {"/pet", {'nova-rest.controllers.pet', 'manage'}, #{methods => [options, get, post]}},
    {"/pet/:petid", {'nova-rest.controllers.pet', 'manage'}, #{methods => [options, get, put, delete]}}
  ]
}.