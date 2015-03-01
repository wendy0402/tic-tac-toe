#! /usr/bin/env ruby

Dir[File.expand_path('../libs/**/*.rb',__FILE__)].each { |f| require f }

game = Game.new
game.play