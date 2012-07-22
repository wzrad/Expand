module GamesHelper
  
  CHARS = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J","K"]

  def verify_user_in_game
    redirect_to :portal unless current_user.can_view_game?(params[:id])
  end

  def redirect_user_to_started_game
    game = Game.get_started_game_for(current_user)
    redirect_to game if game
  end
    
  def get_board_array_from_game(game)
    board = Array.new(game.template.height) { Array.new }

    r = 0
    ix = 0

    while r < game.template.height
      c = 0

      while c < game.template.width
        board[r][c] = {:state => game.turns.last.board[ix], :row => r, :column => c}
        ix = ix + 1
        c = c + 1
      end
      r = r + 1
    end

    return board
  end
  
  def find_tiles_for (playerIX, board)
    ret = Array.new
    i = 0
    board.chars.to_a.each do |c|
      ret.push(i) if c.ord - 48 == playerIX
      i += 1
    end
    ret.sort
    ret
  end

  def tile_ix_to_name (ix, template)
    row = ix / template.width
    col = ix % template.width + 1

    CHARS[row] + col.to_s
  end
end
