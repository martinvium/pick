$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pick'
require 'helpers/config_builder'

RSpec.configure do |c|
  c.include ConfigBuilder
end
