# encoding: utf-8

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end

Lob.create([
  { :author_fb_id => 1066967336, :user_fb_id => 1320360487, :description => "erstes Lob", :created_at => "2013-09-13 11:44:37", :updated_at => "2013-09-13 11:44:37" },
  { :author_fb_id => 1320360487, :user_fb_id => 1066967336, :description => "zweites Lob", :created_at => "2013-09-13 12:44:37", :updated_at => "2013-09-13 12:44:37" },
  { :author_fb_id => 1293398323, :user_fb_id => 1066967336, :description => "drittes Lob", :created_at => "2013-09-13 13:44:37", :updated_at => "2013-09-13 13:44:37" }
])


