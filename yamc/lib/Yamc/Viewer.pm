package Yamc::Viewer;
use Mojo::Base 'Mojolicious::Controller';
use File::Basename;
sub view(){
        my $self = shift;

        my $initial_path = $self->stash('path');
        my @list_directories;
        my @list_files;        
        opendir(D,"/$initial_path");
        while(my $var = readdir(D))
        {
                if ($var ne '.' and $var ne '..')
                {
                        if ( -d "/$initial_path/$var"){
                                push(@list_directories,"$var");}
                        else{
                                push(@list_files,"$var");}
                }
        }
        my @order_directories = sort {uc($a) cmp uc($b)} @list_directories;
        my @order_files = sort {uc($a) cmp uc($b)} @list_files;
        my $filename;
        my $dirname;
        $dirname = dirname($initial_path);
        $self->stash(back=>$dirname);
        $self->render(template=>'viewer/directoryview',directories=>\@order_directories,files=>\@order_files,message=>"$initial_path",basepath=>$initial_path);

}
sub root(){
        my $self = shift;
        $self->render(template=>'viewer/rootview');
}
1;