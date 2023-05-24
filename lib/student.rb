class Student
  attr_reader :name, :age, :scores

  def initialize(data)
    @name = data[:name]
    @age = data[:age]
    @scores = []
  end
end
