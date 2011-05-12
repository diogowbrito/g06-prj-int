xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Degrees", :start => @start, :end => @end) do
  @degrees.each do |degree|
    xml.item(degree.name, :title => "Degree", :href => degree.id)
  end
end