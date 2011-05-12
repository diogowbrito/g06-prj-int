xml.instruct!(:xml, :version=>"1.0")

xml.recommendations(:start => @start, :end => @end, :next => @next) do
  @list.each do |item|
    xml.recommendation(item)
  end
end