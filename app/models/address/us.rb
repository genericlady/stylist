class Address::US
  attr_reader :city, :state
  
  def initialize(address)
    city_state_expression = 
    @city = parse_city(address)
    @state = parse_state(address)
  end
  
  def parse_city(address)
    @city = 'new york'
  end
  
  def parse_state(address)
    @state = 'new york'
  end
 
end
