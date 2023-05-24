class Gradebook
  attr_reader :instructor, :courses
# Create a Gradebook class. Each gradebook has an instructor, as well as a way to read that data.

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end
end
