require "date"
require "pry"

DAY = if ARGV[0]
  ARGV[0].rjust(2, "0")
else
  Date.today.strftime("%d")
end
require("./lib/aoc_#{DAY}.rb")
require("./code/day_#{DAY}.rb")
r = Runner.new
r.perform

binding.pry if !@jsw_skip_pry
