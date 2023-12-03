class Runner
  def perform
    lines = Aoc.input.map do |l|
      nums = l.gsub(/[^1-9]/, "")
      "#{nums[0]}#{nums[-1]}".to_i
    end
    puts "Answer 1: #{lines.sum}" #53,194

    # nums = i.map {|l| JswStrings.words_to_num(l)}
    dig = Aoc.input.map {|s| Aoc.first_last_dig(s)}
    puts "Answer 2: #{dig.sum}" #52,249
  end
end
