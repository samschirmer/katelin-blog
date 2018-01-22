class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :pull_master_css

	def pull_master_css
		@master_css = Stylesheet.where(active: 1).order(:order)
	end
end
