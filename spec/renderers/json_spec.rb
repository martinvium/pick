require 'spec_helper'

RSpec.describe Pick::Renderer::JSON do
  let(:config) do
    build_config :os, :interests
  end
    
  describe '#render' do
    let(:json) do
      renderer = Pick::Renderer::JSON.new
      obj = renderer.render(config)
      JSON.parse(obj)
    end

    context 'os' do
      subject { subject_question_by_external_code('os') }

      it 'question has a name' do
        expect(subject.fetch('label')).to eq('translated os')
      end

      it 'question has a widget' do
        expect(subject.fetch('widget')).to eq('pick_one')
      end

      it 'question has 3 options' do
        expect(subject.fetch('options')).to eq([
          {"label"=>"translated windows", "external_code"=>"windows"},
          {"label"=>"translated osx", "external_code"=>"osx"},
          {"label"=>"translated linux", "external_code"=>"linux"}
        ])
      end
    end

    context 'interests' do
      subject { subject_question_by_external_code('interests') }

      it 'question has a name' do
        expect(subject.fetch('label')).to eq('translated interests')
      end

      it 'question has a widget' do
        expect(subject.fetch('widget')).to eq('pick_many')
      end

      it 'question has 3 options' do
        expect(subject.fetch('options')).to eq([
          {"label"=>"translated programming", "external_code"=>"programming"},
          {"label"=>"translated carpenting", "external_code"=>"carpenting"},
          {"label"=>"translated music", "external_code"=>"music"},
          {"label"=>"translated binge_drinking", "external_code"=>"binge_drinking"}
        ])
      end
    end
  end

  def subject_question_by_external_code(code)
    json.fetch('questions').detect{|q| q['external_code'] == code }
  end
end
