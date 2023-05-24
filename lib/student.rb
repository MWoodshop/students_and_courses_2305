class Student
  attr_reader :name, :age, :scores

  def initialize(data)
    @name = data[:name]
    @age = data[:age]
    @scores = []
  end

  def log_scores(score)
    @scores << score
  end

  def grade
    @scores.sum / @scores.length.to_f
  end
end
