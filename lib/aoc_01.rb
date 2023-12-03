class Aoc
  class << self
  def input(test_data = false, test_string: nil)
      if !test_string.nil?
        test_string
      elsif test_data
        <<~EOF
          two1nine
          eightwothree
          abcone2threexyz
          xtwone3four
          4nineeightseven2
          zoneight234
          7pqrstsixteen
        EOF
      else
        File.read("./input/01.input")
      end.split("\n")
    end

    def words_to_num(str)
      r_hash = {"one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}
      str.gsub(/(one|two|three|four|five|six|seven|eight|nine)/, r_hash)
    end

    def first_last_dig(str)
      d = str.match(/(?:([1-9]|one|two|three|four|five|six|seven|eight|nine))/)[1]
      d += str.match(/.*(?:([1-9]|one|two|three|four|five|six|seven|eight|nine))/)[1]
      words_to_num(d).to_i
    end

    def fl(str)
      nums = str.gsub(/[^0-9]/, "")
      "#{nums[0]}#{nums[-1]}".to_i
    end
  end
end
