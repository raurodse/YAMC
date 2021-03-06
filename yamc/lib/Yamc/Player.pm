package Yamc::Player;
use Mojo::Base 'Mojolicious::Controller';
sub play(){
        my $self = shift;
        my $command = "mplayer /".$self->stash('path')." -ss ".$self->stash('time');
        print "$command\n";
        my $salida = `$command`;
        # Render template "example/welcome.html.ep" with message
        my @partido = split('\n',$salida);   
        my $position = 0;
        my $output="";
        while($position <= $#partido)
        {
                my $tempvar = $partido[$#partido - $position];
                if ($tempvar =~ m/^A: /)
                {
                        $output = $tempvar;
                        last;
                }
                else
                {
                        $position++;
                }
        }
        $output =~ s/.* V:[[:blank:]]+([0-9]+\.[0-9]*) .*/ $1 /;
        if($output >=3){
                $output -= 3;
        }
        else{
                $output = 0;
        }
        $self->render(template=>'player/play',output=>$output);
}
1;