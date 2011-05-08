class Element

  attr_reader :type, :title, :value, :href

  def initialize(type = "default", value = "default", href = "default", title = "default")
    @type, @value, @href, @title = type, value, href, title
  end

end
