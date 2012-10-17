class GuyPlayer

  def name
    "Team Totally Super Special Awesome"
  end

  def take_turn(state, colour)
    our_colour = colour
    if our_colour == :blue
      their_colour = :red
    else
      their_colour = :blue
    end
    #check columns for three in a row of our colour
    columns = state
    columns.each_with_index do |column, column_no|
      counter = 0
      column.each do |row|
        if row == our_colour
          counter += 1
        elsif row == their_colour
          break
        end
      end
      if counter == 3
        return column_no if is_legal_move? column_no
      end
    end


    #check rows for three in a row of their colour
    [0..6].each do |row|
      examined_columns = []
      counter = 0
      columns.each_with_index do |column,column_no|
        examined_columns << column_no
        if column[row] == our_colour
          counter += 1
        else
          counter = 0
          examined_columns = []
        end

        if counter == 3
          return (column_no + 1) if is_legal_move? state, (column_no + 1)
          return (examined_columns.first - 1) if is_legal_move? state, (examined_columns.first - 1)
        end
      end
    end
    #check columns for three in a row of their colour
    state = columns
    columns.each_with_index do |column, column_no|
      counter = 0
      column.each do |row|
        if row == their_colour
          counter += 1
        elsif row == our_colour
          break
        end
      end
      if counter == 3
        return column_no if is_legal_move? column_no
      end
      #check rows for three in a row of their colour
      [0..6].each do |row|
        examined_columns = []
        counter = 0
        columns.each_with_index do |column,column_no|
          examined_columns << column_no
          if column[row] == their_colour
            counter += 1
          else
            counter = 0
            examined_columns = []
          end

          if counter == 3
            return (column_no + 1) if is_legal_move? state, (column_no + 1)
            return (examined_columns.first - 1) if is_legal_move? state, (examined_columns.first - 1)
          end
        end
      end
    end


    #Backup plan
    random_number = rand(7)
    while !is_legal_move?(state, random_number)
      random_number = rand(7)
    end
    return random_number
  end

  def find_possible_moves(state)
    legal_moves = []
    state.each_with_index do |column, column_no|
      if column.reverse.find :none
        legal_moves << [column_no, column.reverse.find(:none)]
      end
    end
    return legal_moves
  end

  def find_legal_moves(state)
    legal_moves = []
    state.each_with_index do |column, column_no|
      if column.reverse.find :none
        legal_moves << column_no
      end
    end
    return legal_moves
  end

  def is_legal_move?(state, column)
    move = column
    if find_legal_moves(state).include? move
      return true
    else
      return false
    end
  end
end