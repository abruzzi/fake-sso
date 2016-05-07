require 'sinatra'
require 'uri'

set :return_url, ''
set :bind, '0.0.0.0'
set :w3_id, 'wwx363344'

get '/sso' do
    settings.return_url = params[:return]+"?w3=#{settings.w3_id}"
    send_file 'public/index.html'
end

post '/login' do
	uri = URI.parse(settings.return_url == '' ? 'localhost': settings.return_url)
	response.set_cookie("w3", {
		:domain => ".#{uri.host}",
	    :expires => Time.now + 2400,
	    :value => "#{settings.w3_id}",
	    :path => '/'
  	})
	redirect settings.return_url, 302
end
