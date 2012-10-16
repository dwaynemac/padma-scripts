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
puts "fetching #{dir.gsub("/","")} origin"
  puts `cd #{dir} && git fetch origin`
end
