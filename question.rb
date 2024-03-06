class Question
  def initialize
    @num1 = rand(1...21)
    @num2 = rand(1...21)
  end

  def create_question
    "what does #{@num1} plus #{@num2} equal?"
  end

  def check_answer(num)
  sum = @num1 + @num2
  sum == num.to_i
  end

end
