#!/usr/bin/env ruby
%W(
  crm-hub
  contacts
  activity_stream
  overmind
  nucleo_api
  padma-accounts-ws
  Padma
  padma-assets
  padma-planning-ws
  clients/activity_stream
  clients/logical_model
  clients/overmind
).each do |dir|
  output = `cd #{dir} && git status`
  if output =~ /nothing to commit/
    puts "#{dir.gsub("/","")}: clean"
  else
    puts "==> #{dir.gsub("/","")}: DIRTY!"
  end
end
