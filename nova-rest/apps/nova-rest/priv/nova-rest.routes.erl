#{prefix => "",
  security => false,
  routes => [
    {"/pet", {'nova-rest-controller', 'manage-pet'}, #{methods => [options, get, post]}},
    {"/pet/:petid", {'nova-rest-controller', 'manage-pet'}, #{methods => [options, get, put]}}
  ]
}.