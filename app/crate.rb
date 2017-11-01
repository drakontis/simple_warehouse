class Crate
  attr_reader :product_code, :position, :slot

  def initialize(product_code:, position:, slot:)
    @product_code = product_code
    @position = position
    @slot = slot
  end
end
