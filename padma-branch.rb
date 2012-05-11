#!/usr/bin/env ruby

if ARGV.length != 2 then
  puts "Usage: padma_branch story_id branch_name\n"
  Process.exit
end


def create_branch(id, name)
  process = Proc.new do
    |command| output = command
    puts output
    if not $?.success? then
      puts "Branch couldn't be created\n"
      Process.exit
    end
  end

  process.call `git pull`
  process.call `git checkout -b #{id + "-" + name}`
  process.call `git commit --allow-empty -m '[##{id}]First commit'`
  process.call `git push -u origin #{id + "-" + name}`

  puts "Branch created successfully\n"
end

create_branch(ARGV[0], ARGV[1])
