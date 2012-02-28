package Yamc::Example;
use Mojo::Base 'Mojolicious::Controller';

sub initial(){
        my $self = shift;
        my @list_directories = [];
        $self->render(directories=>@list_directories);
}