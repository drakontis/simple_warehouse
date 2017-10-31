class Store
  attr_reader :width, :height, :crates

  def initialize(wid, hei)
    @width = wid
    @hei = hei
    @crates = []
  end
end