require 'json'

module Pick
  module Renderer
    class JSON
      def render(config)
        questions = render_questions(config.questions)
        ::JSON.generate(questions: questions)
      end

      def render_questions(questions)
        questions.collect do |q|
          {
            label: translate(q.name),
            widget: q.widget,
            options: render_picks(q.picks)
          }
        end
      end

      def render_picks(picks)
        picks.collect do |p|
          {
            label: translate(p),
            external_code: p
          }
        end
      end

      def translate(name)
        "translated #{name}"
      end
    end
  end
end
