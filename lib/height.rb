class Height
  attr_reader :inches
  def initialize(inches)
    @inches = inches.to_i
  end
  def feet; inches / 12; end
  def inch; inches % 12; end
  def to_s
    if inch.zero?
      %Q{#{feet}'}
    else
      %Q{#{feet}'#{inch}"}
    end
  end
end
