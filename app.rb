require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'json'

set :database, 'postgres://database.db'

@@count = 0

get '/' do
  @title = "Counting Page"
  erb :index  
end

post '/' do
  @@count = @@count + 1
end

get '/count' do
  content_type :json
  {:count => @@count}.to_json
end

__END__

@@layout
<html>
  <head>
     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <title>
      <%= @title %>
    </title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

@@index
<h1> Welcome to Our Site </h1>
  <p id="instructions"> We will be counting the number of times this button has EVER been pressed. <p>
  <p id="count"><%= @@count%></p>
  <input class="button" type="button" value="CLICK ME">
  <script type='text/javascript'>
    $('.button').click(function() {
      $.post('/');
    });
    function refreshCount() {
      $.get('/count', {}, function(data) {
        $("#count").html(data.count);
      });
      setTimeout(refreshCount, 500);
    }
    setTimeout(refreshCount, 1000);
  </script>

