#puts "running boot.rb"

require 'rubygems'
if defined?('bundler/setup')
	#puts("'bundler/setup' exists")
	require 'bundler/setup'
	#puts("bundler/setup done")
elsif
	puts("no bundler/setup")
end

