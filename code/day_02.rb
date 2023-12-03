class Runner
  def perform
    games = Aoc.sort_games Aoc.input false
    possibles = games.map {|g| Aoc.possible_games(g)}
    puts "Possible Games: #{possibles.sum}" #2,416
    powers = games.map {|g| Aoc.power(g)}
    puts "Sum of Powers: #{powers.sum}" #63,307
  end
end
