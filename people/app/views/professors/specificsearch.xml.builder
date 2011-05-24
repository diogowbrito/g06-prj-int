xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => @keyword, :start => @start, :end => @end, :next => @next) do
  @list.each do |item|
    xml.item(item.professor_name, :title => "Professor", :href => "http://localhost:3001/people/"+item.id.to_s)
  end
end