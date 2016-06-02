module Pick
  module Widget
    class PickOne
      attr_reader :name, :picks

      def initialize
        @picks = []
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
