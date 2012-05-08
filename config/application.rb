# load libraries required on boot
require File.expand_path('../boot', __FILE__)

# the action controller that serves requests
require 'rails/all'

#other action controllers



# libraries required for the application to run
# include :default and current environment libraries
Bundler.require :default, Rails.env

# application itself
module RailsPatton
	class Application < Rails::Application
		# Configure the default encoding used in templates for Ruby 1.9.
		config.encoding = "utf-8"
	end
end



