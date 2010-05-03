PICOMBO = File.expand_path(Dir.getwd) + '/'
APPPATH = PICOMBO + 'application/'

$LOAD_PATH.unshift(File.expand_path(Dir.getwd) + '/../picombo.git/lib/')
$LOAD_PATH.unshift(APPPATH)

# app better be defined in here!
require 'rubygems'
require 'singleton'
require 'core/core_cli'
require 'classes/config'

puts Picombo::Core.new.call