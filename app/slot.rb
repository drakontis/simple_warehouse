class Slot
  attr_reader :starts_at,
              :ends_at

  def initialize(starts_at:, ends_at:)
    @starts_at = starts_at
    @ends_at = ends_at
  end

  def overlapping?(slot)
    contains?(slot.starts_at) || contains?(slot.ends_at)
  end

  def contains?(position)
    position.x >= starts_at.x && position.y >= starts_at.y && position.x <= ends_at.x && position.y <= ends_at.y
  end
end
