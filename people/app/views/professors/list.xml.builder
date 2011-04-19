xml.list(:title => "Professors' List") do
  @professors.each do |professor|
    xml.item(professor.professor_name, :title => "Professor", :href => professor.id)
  end
    xml.start(@start)
    xml.end(@end)
end