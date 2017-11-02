module Store
  class Crate
    attr_reader :product_code, :slot

    def initialize(product_code:, slot:)
      @product_code = product_code
      @slot = slot
    end
  end
end
