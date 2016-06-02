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
      question = Widget::PickOne.new
      question.setup(name, block)
      @questions << question
      question
    end
  end
end
