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
end
