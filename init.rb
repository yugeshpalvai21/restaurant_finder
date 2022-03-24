#This is starting point of programm

# ruby maintails special variable called $: which maintains array of all lookup paths
# $:.each { |path| puts path }

APP_ROOT = File.dirname(__FILE__)

require File.join(APP_ROOT, 'lib', 'guide')

guide = Guide.new
p guide


