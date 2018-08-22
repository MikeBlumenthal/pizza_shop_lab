class Thing
  attr_reader :hen, :den

  def initialize(one, two)
    @hen = one
    @den = two
  end

end

thing = Thing.new(1, 2)

p thing.attribute
