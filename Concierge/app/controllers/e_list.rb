class EList

  attr_reader :value, :list

  def initialize(value = "default", list = [])
    @value, @list = value, list
  end

end
