require "pick/version"
require "pick/config"
require "pick/widgets/pick_one"
require "pick/widgets/pick_many"
require "pick/renderers/json"
require 'pry'

module Pick
  def self.config(&block)
    Config.new.setup(block)
  end
end
