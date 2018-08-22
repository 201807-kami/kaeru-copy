class Admin::HomeController < ApplicationController
	layout 'admin'

	def index
		render 'admin/home'
	end

end