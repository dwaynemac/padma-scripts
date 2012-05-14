#!/usr/bin/env ruby

class MergeScript

  def initialize
    @process = Proc.new do
      |command, dont_print_output| output = command
      unless dont_print_output
        puts output
      end
      if not $?.success? then
        puts "Branch couldn't be merged\n"
        Process.exit
      end
      output
    end
  end

  def merge_forbidden(branch)
    @process.call(`git checkout #{branch}`, true)
    has_match = /\smaster\n/.match(@process.call(`git branch --no-merged`, true))
    @process.call(`git checkout master`, true)
    return has_match
  end

  def merge(branch)
    @process.call(`git fetch`, true)

    current_branch = /\w+/.match(@process.call(`git branch | grep "*"`, true)).to_s
    if current_branch == "master" then
      if merge_forbidden(branch) then
        puts "Merge forbidden!\nFirst merge master into #{branch}\n"
        Process.exit
      end
    end

    @process.call `git merge #{branch}`
    puts "Branch merged successfully\n"
  end

end

if ARGV.length != 1 then
  puts 'Usage: padma-merge branch_name'
else
  script = MergeScript.new
  script.merge ARGV[0]
end

