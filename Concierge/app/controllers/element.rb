class Element

  @type = "default"
  @value = "default"
  @href = "default"

  def new(type, value)
    @type = type
    @value = value
  end

  def new(type, value, href)
    @type = type
    @value = value
    @href = href
  end

  def getType
    return @type
  end

  def getValue
    return @value
  end

  def getHref
    return @href
  end

end
