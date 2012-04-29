#!/usr/bin/env ruby
Dir['*/'].each do |dir|
  output = `cd #{dir} && git status`
  if output =~ /nothing to commit/
    puts "#{dir.gsub("/","")}: clean"
  else
    puts "==> #{dir.gsub("/","")}: DIRTY!"
  end
end
