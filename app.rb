require 'sinatra'
require 'uri'

set :return_url, ''
set :bind, '0.0.0.0'

get '/sso' do
    settings.return_url = params[:return]
    send_file 'public/index.html'
end

post '/login' do
	credential = params[:credential]
	uri = URI.parse(settings.return_url)
	response.set_cookie("w3", {
		:domain => ".#{uri.host}",
	    :expires => Time.now + 2400,
	    :value => "#{credential['name']}",
	    :path => '/'
  	})
	redirect settings.return_url, 302
end
