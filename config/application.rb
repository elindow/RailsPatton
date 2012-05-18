# load libraries required on boot
require File.expand_path('../boot', __FILE__)

# the action controller that serves requests
require 'rails/all'

#other action controllers


# libraries required for the application to run
# include :default and current environment libraries
if defined?(Bundler)
	#puts "Bundler exists"
	Bundler.require :default, Rails.env
elsif
	puts "No Bundler"
end

# application itself
module RailsPatton
	class Application < Rails::Application
		# Configure the default encoding used in templates for Ruby 1.9.
		config.encoding = "utf-8"
		config.active_support.deprecation = :log
		# Enable the asset pipeline
		config.assets.enabled = true
	end
end



