class EList

  @value= "default"
  @list = []

  def new(value, list)
    @value = value
    @list = list
  end

  def getValue
    return @value
  end

  def getList
    return @list
  end

end
