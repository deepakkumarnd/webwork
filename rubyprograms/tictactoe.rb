#!/bin/ruby

class Board

  def initialize
    @squares = Array.new 9
    # Eight ways to win
    @winners = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  end

  def to_s
    out = "" 
    for row in 0..2
      out += "-----------\n" unless row == 0
      for col in 0..2
        out += "|" unless col == 0
        out += case @squares[row * 3 + col]
          when :x : "(X)" 
          when :o : "(O)" 
          else " " + (row * 3 + col).to_s + " " 
        end
      end
      out += "\n" 
    end
    out
  end

  def add(symbol, position)
    if valid_move? position
      @squares[position] = symbol
      true
    else
      false
    end
  end

  def win?(player)
    @winners.map do |winner|
      ((winner.map { |pos| @squares[pos] == player } ).include? false)
    end.include? false
  end

  def full?
    not @squares.include? nil
  end

  def valid_move?(position)
    !(position < 0 or position > 8 or @squares[position])
  end

  def eval_move(player, position, depth)
    return nil if not valid_move? position
    @squares[position] = player     # I adjust
    move_value = if win? player
      1
    elsif depth == 0 or full?
      0
    else
      moves = (0..8).map do |pos|
        eval_move(other_player(player), pos, depth - 1)
      end
      -((moves.find_all { |move| move }).max) # Negamax
    end
    @squares[position] = nil    # I am done adjusting
    move_value
  end

  def best_move(player)
    best = -10
    for position in 0..8
      # Gets really slow if looking ahead more than 4 moves
      val = eval_move(player, position, 4)
      print " #{val}" 
      position_of_best = position and best = val if val and val > best
    end
    position_of_best
  end

  def other_player(player)
    player == :x ? :o : :x
  end

end

class Game

  def initialize(options = {})
    @board = Board.new
    @player = :x
    @computer = options[:computer] || :x
    while play do; end
  end

  def play
    draw_board
    if @player == @computer
      print "\n Thinking. . ." 
      @board.add(@player, @board.best_move(@player))
    else
      print "\n#{@player.to_s} Enter your move: " 
      while not @board.add(@player, gets.chomp.to_i) do
        print "\nInvalid Move: " 
      end
    end
    if @board.win? @player
      draw_board
      puts "#{@player.to_s} wins" 
      false
    elsif @board.full?
      draw_board
      puts "Tie" 
      false
    else
      switch
      true
    end
  end

  def switch
    @player = @board.other_player(@player)
  end

  def draw_board
    print "\n" + @board.to_s
  end

end

def you_first
  Game.new(:computer => :x)
  nil
end

def me_first
  Game.new(:computer => :o)
  nil
end
