class Visitor
  attr_reader :name, :height, :spending_money, :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete_prefix('$').to_i
    @preferences = []
  end

  def add_preference(pref)
    @preferences << pref
  end


  def tall_enough?(certain_height)
    @height >= certain_height
  end
end
