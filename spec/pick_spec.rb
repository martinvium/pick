require 'spec_helper'

RSpec.describe Pick do
  it 'has a version number' do
    expect(Pick::VERSION).not_to be nil
  end

  describe '#pick_one' do
    subject do
      build_config :os
    end

    it 'question is registered' do
      expect(subject.questions.count).to eq(1)
    end

    it 'question is right type' do
      expect(subject.questions.first).to be_a(Pick::Widget::PickOne)
    end

    it 'question has a name' do
      expect(subject.questions.first.name).to eq(:os)
    end

    it 'question has 3 picks registered' do
      expect(subject.questions.first.picks).to eq([
        :windows,
        :osx,
        :linux
      ])
    end
  end
end
