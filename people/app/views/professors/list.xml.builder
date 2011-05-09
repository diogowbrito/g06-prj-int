xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Professors", :start => @start, :end => @end) do
  @professors.each do |professor|
    xml.item(professor.professor_name, :title => "Professor", :href => professor.id)
  end
end