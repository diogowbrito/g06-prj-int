xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => @keyword, :start => @start, :end => @end, :next => @next) do
  @list.each do |item|
    xml.item(item.department_name, :title => "Department", :href => "http://localhost:3003/departments/"+item.id.to_s)
  end

  @list1.each do |item|
    xml.item(item.organ_name, :title => "Organ", :href => "http://localhost:3003/organs/"+item.id.to_s)
  end

  @list2.each do |item|
    xml.item(item.service_name, :title => "Services", :href => "http://localhost:3003/services/"+item.id.to_s)
  end
end