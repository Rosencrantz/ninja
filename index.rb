require 'sinatra'
require 'json'
require 'pp'

set :public_folder, File.dirname(__FILE__) + '/public'

post '/save/?' do
		File.open('public/examples/' + params[:filename], 'w') do |f|
			code = params[:code]
			code.slice!(0)
			code.chomp!("\"")
			code.gsub!("\\\"", "\"")
			code.gsub!("\\n", "\n")
			code.split("\n")
			code.each do |z|
				f.puts z
			end
  		end
end
