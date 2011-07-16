require 'rubygems'
require 'sinatra'

not_found do
	erb :not_found
end

get "/" do
	erb :index
end

get "/:content/?" do
	@content = find_content(params[:content])
	halt 404 unless @content
	@content
end

helpers do
	def find_content(content)
		@user = params[:user]
		case content
		when "dashboard"
			erb :dashboard
		when "account"
			erb :account
		when "profile"
			erb :profile
		when "about"
			erb :about
		when "contact"
			erb :contact
		end
	end
end