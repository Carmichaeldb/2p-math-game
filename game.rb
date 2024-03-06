require './player'
require './question'

class Game
  puts "Starting new Math Game. Ready... Set... PLAY!"

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @player_turn = @player1
  end

  def switch_player
    @player_turn = @player_turn == @player1 ? @player2 : @player1
  end

  def ask_question
    question = Question.new
    puts "#{@player_turn.name}: #{question.create_question}"
    answer = question.check_answer(gets.chomp)
    if answer
    puts "#{@player_turn.name}: YES! You are correct."
    switch_player
    current_scores
    else
    puts "#{@player_turn.name}: Seriously? No!"
    @player_turn.reduce_score
    switch_player
    current_scores
    end
  end

  def current_scores
   if  @player1.score == 0
    puts "#{@player2.name} wins with a score of #{@player2.score}"
    puts "--- GAME OVER ---"
    puts "Good Bye!"
   elsif @player2.score == 0
    puts "#{@player1.name} wins with a score of #{@player1.score}"
    puts "--- GAME OVER ---"
    puts "Good Bye!"
   else
    puts "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
    ask_question
   end

  end

end

test = Game.new
test.ask_question
