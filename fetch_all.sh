#!/usr/bin/env ruby
Dir['*/'].each do |dir|
puts "fetching #{dir.gsub("/","")} origin"
  puts `cd #{dir} && git fetch origin`
end
