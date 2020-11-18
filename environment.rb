# require all of our files so they can talk to each other 

require 'bundler'
Bundler.require #require all gems in gem file

require_relative "./lib/api" #requiring something that is in the same repo folder and if someone clones it it will be in the same location 
require_relative "./lib/cli"
require_relative "./lib/model"