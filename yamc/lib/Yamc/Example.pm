package Yamc::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  my $aux = $self->stash('nombre');
  $self->render(
    message => "Hola $aux");
}
1;
sub adios {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(template=>'example/welcome',
    message => 'Esto es una puta mierda');
}

1;