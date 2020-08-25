
def knight_moves(start_square, end_square)
  return nil unless valid?(start_square) && valid?(end_square)
  current_path = [start_square]
  frontier = legal_moves(start_square).map { |square| add_to_path(current_path, square) }
  loop do
    if current_path[-1] == end_square
      break
    end
    current_path = frontier.shift
    frontier += legal_moves(current_path[-1]).map { |square| add_to_path(current_path, square) }
  end
  puts "You made it in #{current_path.length - 1} moves! Here's your path:"
  current_path.each do |square|
    print square
    puts "\n"
  end
end

def valid?(square)
  (square[0] >= 0 && square[0] <= 7) && (square[1] >= 0 && square[1] <= 7)
end

def legal_moves(square)
  moves = []
  moves.push([square[0] + 1, square[1] + 2])
  moves.push([square[0] + 1, square[1] - 2])
  moves.push([square[0] + 2, square[1] + 1])
  moves.push([square[0] + 2, square[1] - 1])
  moves.push([square[0] - 1, square[1] + 2])
  moves.push([square[0] - 1, square[1] - 2])
  moves.push([square[0] - 2, square[1] + 1])
  moves.push([square[0] - 2, square[1] - 1])
  moves.select { |elem| valid?(elem) }
end

def add_to_path(path, square)
  path + [square]
end