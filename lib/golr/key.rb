module Golr

  class Key

    def key(x, y)
      "#{x}_#{y}"
    end

    def self.coordinates(key)
      split = key.split('_')
      [split[0].to_i, split[1].to_i]
    end

  end

end