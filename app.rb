require 'sinatra'
require 'uri'

set :return_url, ''

get '/sso' do
    settings.return_url = params[:return]+"?w3=wwx363344"
    send_file 'public/index.html'
end

post '/login' do
	uri = URI.parse(settings.return_url == '' ? 'localhost': settings.return_url)
	response.set_cookie("w3", {
		:domain => uri.host,
	    :expires => Time.now + 2400,
	    :value => "wwx363344",
	    :path => '/'
  	})
	redirect settings.return_url, 302
end