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
  #$r->route('/')->to('viewer#initial');
  $r->route('/')->to('viewer#root');
  $r->route('view/*path')->to('viewer#view');
}

1;
