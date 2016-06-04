module Pick
  class Config
    attr_reader :questions

    def initialize
      @questions = []
    end

    def setup(block)
      instance_eval(&block)
      self
    end

    def pick_one(name, &block)
      factory(:pick_one, name, block)
    end

    def pick_many(name, &block)
      factory(:pick_many, name, block)
    end

    def factory(widget, name, block)
      class_name = Kernel.const_get("::Pick::Widget::#{camelize(widget)}")
      question = class_name.new
      question.setup(name, block)
      @questions << question
      question
    end

    def camelize(symbol)
      symbol.to_s.split('_').collect(&:capitalize).join
    end
  end
end
