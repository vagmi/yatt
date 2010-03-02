require 'rubygems'
require 'sinatra'
require 'models
'
use_in_file_templates!

get '/' do
  haml :index
end

__END__

@@layout
%html
  %head
    %title Yet another task tracker
  %body= yield

@@index
%h1 Welcome to YATT
.content
  %p Yet another task tracker will help you manage tasks
  %ul
    %li Its simple
    %li Its beautiful
    %li but does not do much

.login
  %p login and registration box goes here.
