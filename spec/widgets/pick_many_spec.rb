require 'spec_helper'

RSpec.describe Pick::Widget::PickMany do
  describe '#pick_many' do
    subject do
      build_config :interests
    end

    it 'question is registered' do
      expect(subject.questions.count).to eq(1)
    end

    it 'question is right type' do
      expect(subject.questions.first).to be_a(Pick::Widget::PickMany)
    end

    it 'question has a name' do
      expect(subject.questions.first.name).to eq(:interests)
    end

    it 'question has 3 picks registered' do
      expect(subject.questions.first.picks).to eq([
        :programming,
        :carpenting,
        :music,
        :binge_drinking
      ])
    end
  end
end
