class StylistPolicy
  attr_reader :user, :stylist

  def initialize(user, stylist)
    @user = user
    @stylist = stylist
  end

  def update?
    binding.pry
  end
end
