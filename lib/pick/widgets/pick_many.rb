module Pick
  module Widget
    class PickMany
      attr_reader :name, :picks, :widget

      def initialize
        @picks = []
        @widget = :pick_many
      end

      def setup(name, block)
        @name = name
        instance_eval(&block)
      end

      def pick(name)
        @picks << name
      end
    end
  end
end
