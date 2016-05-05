require 'sinatra'

set :return_url, ''

get '/sso' do
    settings.return_url = params[:return]+"?w3=wwx363344"
    send_file 'public/index.html'
end

post '/login' do
	redirect settings.return_url, 302
end