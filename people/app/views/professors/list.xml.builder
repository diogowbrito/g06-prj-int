xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Professors", :start => @start, :end => @end, :next => @next) do
  @professors.each do |professor|
    xml.item(professor.professor_name, :title => "Professor", :href => "http://localhost:3001/people/"+professor.id.to_s)
  end
end