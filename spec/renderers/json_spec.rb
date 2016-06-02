require 'spec_helper'

RSpec.describe Pick::Renderer::JSON do
  let(:config) do
    Pick.config do
      pick_one :os do
        pick :windows
        pick :osx
        pick :linux
      end
    end
  end
    
  describe '#render' do
    subject do
      renderer = Pick::Renderer::JSON.new
      obj = renderer.render(config)
      JSON.parse(obj)
    end

    it 'question has a name' do
      expect(subject.fetch('questions').first.fetch('label')).to eq('translated os')
    end

    it 'question has a widget' do
      expect(subject.fetch('questions').first.fetch('widget')).to eq('pick_one')
    end

    it 'question has 3 options' do
      expect(subject.fetch('questions').first.fetch('options')).to eq([
        {"label"=>"translated windows", "external_code"=>"windows"},
        {"label"=>"translated osx", "external_code"=>"osx"},
        {"label"=>"translated linux", "external_code"=>"linux"}
      ])
    end
  end
end
