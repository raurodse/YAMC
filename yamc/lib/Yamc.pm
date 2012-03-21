package Yamc;
use Mojo::Base 'Mojolicious';
use MongoDB;
# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Routes
  my $r = $self->routes;

  $self->attr(db => sub { 
        MongoDB::Connection->new(host => 'mongodb://localhost:27017')->get_database('yamcdb');
    });
  $self->helper('db' => sub { shift->app->db });


  # Normal route to controller  
  #$r->route('/')->to('viewer#initial');
  $r->route('/')->to('viewer#root');
  $r->route('/view/:path',path=>qr/.*/)->to('viewer#view');
  $r->route('/play/(.time)/:path',path=>qr/.*/)->to('player#play');
}

1;
