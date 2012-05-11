#!/usr/bin/env ruby

def finish_branch(story_id=nil)
  process = Proc.new do
    |command, dont_print_output| output = command
    unless dont_print_output
      puts output
    end
    if not $?.success? then
      puts "Story could't be finished\n"
      Process.exit
    end
    output
  end

  if story_id.nil? then
    branch_name = process.call(`git branch | grep "*"`, true)
    story_id = /\d+/.match(branch_name).to_s
    if story_id.empty? then
      puts "Sorry, couldn't extract the story id from branch name\n"
      puts "Story could't be finished\n"
      Process.exit
    end
  end

  process.call `git commit --allow-empty -m '[Fixes ##{story_id}]Last commit'`
  process.call `git push`
  puts "Story finished successfully\n"
end

case ARGV.length
  when 0
    finish_branch
  when 1
    finish_branch ARGV[0]
  else
    puts "Usage: padma_finish [story_id]\n"
    Process.exit
end
