class WmrugPlayer
  def initialize
    @last_move = []
    @our_positions = []
    @their_positions = []
  end

  def name
    "Andy & Tom"
  end

  def take_turn(state, colour)
    @state = state
    @colour = colour
    if board_empty?
      return 3
    end
    return 2 unless column_full?(2)

    pick_position
  end

  def pick_position
    move_col = rand(7)
  end

  def can_we_win?
    @our_positions = []
    @their_positions = []
    (0..6).each do |x|
      (0..5).each do |y|
        case @state[x,y]
        when @colour
          @our_positions.push [x,y]
        when :none
        else
          @their_positions.push [x,y]
        end
      end
    end
  end

  def board_empty?
    @state.flatten.all? {|i| i == :none }
  end

  def column_full?(column)

    @state[column][0] == :none
  end
end

