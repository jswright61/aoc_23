class Aoc
  class << self
    def input(test_data = false, test_string: nil)
      if !test_string.nil
        test_string
      elsif test_data
        <<~EOF
        EOF
      else
        File.read("input/10.input")
      end.split("\n")
    end
  end
end
