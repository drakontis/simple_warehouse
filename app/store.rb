class Store
  attr_reader :width, :height, :crates

  def initialize(wid:, hei:)
    @width = wid
    @height = hei
    @crates = []
  end
end
