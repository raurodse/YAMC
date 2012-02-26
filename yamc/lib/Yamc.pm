package Yamc;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Routes
  my $r = $self->routes;

  # Normal route to controller  
  $r->route('/:nombre',nombre=>['raul','tere'])->to('example#welcome');
  $r->route('/:id',id=>qr/.*/)->to('example#adios');
}

1;
