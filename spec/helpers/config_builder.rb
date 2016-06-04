module ConfigBuilder
  def build_config(*symbols)
    Pick.config do
      if symbols.include? :os
        pick_one :os do
          pick :windows
          pick :osx
          pick :linux
        end
      end

      if symbols.include? :interests
        pick_many :interests do
          pick :programming
          pick :carpenting
          pick :music
          pick :binge_drinking
        end
      end
    end
  end
end
