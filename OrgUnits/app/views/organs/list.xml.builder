xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Organs", :start => @start, :end => @end, :next => @next) do
  @organs.each do |organ|
    xml.item(organ.organ_name, :title => "Organ", :href => "http://localhost:3003/organs/"+organ.id.to_s)
  end
end