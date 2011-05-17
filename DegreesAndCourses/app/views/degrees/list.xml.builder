xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Degrees", :start => @start, :end => @end) do
  @degrees.each do |degree|
    xml.item(degree.name, :title => "Degree", :href => "http://localhost:3002/degrees/" + degree.id.to_s)
  end
end