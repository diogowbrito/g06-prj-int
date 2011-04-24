class Element

  attr_reader :type, :value, :href

  def initialize(type = "default", value = "default", href = "default")
    @type, @value, @href = type, value, href
  end

end
