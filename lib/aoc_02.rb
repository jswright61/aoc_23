class Aoc
  class << self
    def input(test_data = false, test_string: nil)
      if !test_string.nil?
        test_string
      elsif test_data
        <<~EOF
          Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
          Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
          Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
          Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
          Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        EOF
      else
        File.read("input/02.input")
      end.split("\n")
    end

    def sort_games(arr)
      games = []
      g_reg = /game\s(\d+):/i
      arr.each do |el|
        reds = []
        blues = []
        greens = []
        pulls = []
        split_game = el.split(":")
        # binding.pry
        game_no = split_game[0].sub("Game ", "").to_i
        rounds = split_game[1].split(";")
        rounds.each_with_index do |p, idx|
          red = p.match(/(\d+)\s+red/i)&.to_a&.at(1).to_i
          blue = p.match(/(\d+)\s+blue/i)&.to_a&.at(1).to_i
          green = p.match(/(\d+)\s+green/i)&.to_a&.at(1).to_i
          reds << red
          greens << green
          blues << blue
          pulls << [red, green, blue]
        end

        games << {game: game_no, pulls: pulls, reds: reds, greens: greens, blues: blues}
      end
      games
    end

    def possible_games(result, red: 12, green: 13, blue: 14)
      if result[:reds].max <= red && result[:greens].max <= green && result[:blues].max <= blue
        result[:game]
      else
        0
      end
    end

    def power(result)
      result[:reds].max * result[:blues].max * result[:greens].max
    end
  end
end
