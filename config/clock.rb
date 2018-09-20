# frozen_string_literal: true
# From here http://gears.generalassemb.ly/2015/03/31/clockwork-on-heroku/
require 'clockwork'
require 'active_support/time' 
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
    job.constantize.perform_later
  end
    every(3.minutes, 'UpdatePairsJob')
end

# to start locally use bundle exec clockwork config/clock.rb