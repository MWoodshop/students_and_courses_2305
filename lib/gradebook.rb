class Gradebook
  attr_reader :instructor, :courses

  # You have been contracted by the University of Denver to write a program that models gradebooks for its courses. Use TDD to implement the following features:

  # Create a Gradebook class. Each gradebook has an instructor, as well as a way to read that data.
  # Each gradebook has courses, as well as a way to read that data.
  # A gradebook can list_all_students in its courses.
  # A gradebook can students_below(threwhold) to return a list of students whose grades are below a given threshold.
  # Method Name	Return Value (type)
  # instructor	String
  # courses	Array of Course objects
  # add_course(course)	Array of Course objects including the new one just added.
  # list_all_students	Hash where the key is a Course object and the value is an Array of Student objects
  # students_below(threshold)	Array of Student objects
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    @courses.map { |course| [course, course.students] }.to_h
  end

  def students_below(threshold)
    students = []
    @courses.each do |course|
      course.students.each do |student|
        students << student if student.grade < threshold
      end
    end
    students
  end
end
