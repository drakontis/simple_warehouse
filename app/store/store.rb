module Store
  class Store
    attr_reader :width, :height, :crates

    def initialize(width:, height:)
      @width = width
      @height = height
      @crates = []
    end
  end
end
