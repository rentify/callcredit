class Address
  attr_accessor :number, :postcode
  def initialize(*params)
    unless params.count == 0
      @number = params.first[:number]
      @postcode = params.first[:postcode]
    end
  end
end
