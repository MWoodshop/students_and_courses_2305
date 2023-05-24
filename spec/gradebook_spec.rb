require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'
require 'pry'
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

# Iteration 3
RSpec.describe Gradebook do
  describe 'initialize' do
    it 'can initialize' do
      gradebook = Gradebook.new('Prof. McGonagall')
      expect(gradebook).to be_a(Gradebook)
    end
    it 'returns correct value on initialize' do
      gradebook = Gradebook.new('Prof. McGonagall')
      expect(gradebook.instructor).to eq('Prof. McGonagall')
      expect(gradebook.courses).to eq([])
    end
  end

  describe 'courses' do
    it 'can add courses' do
      gradebook = Gradebook.new('Prof. McGonagall')
      course1 = Course.new('Calculus', 2)
      gradebook.add_course(course1)
      expect(gradebook.courses).to include(course1)
    end

    it 'can list all students' do
      gradebook = Gradebook.new('Prof. McGonagall')
      course1 = Course.new('Calculus', 2)
      student1 = Student.new({ name: 'Harry', age: 21 })
      student2 = Student.new({ name: 'Ron', age: 21 })
      course1.enroll(student1)
      course1.enroll(student2)
      gradebook.add_course(course1)

      expect(gradebook.list_all_students).to eq({ course1 => [student1, student2] })
    end
  end

  describe 'students_below' do
    it 'can list students below a threshold' do
      gradebook = Gradebook.new('Prof. McGonagall')
      course1 = Course.new('Calculus', 2)
      student1 = Student.new({ name: 'Harry', age: 21 })
      student2 = Student.new({ name: 'Ron', age: 21 })
      course1.enroll(student1)
      course1.enroll(student2)
      gradebook.add_course(course1)
      student1.log_scores(89)
      student1.log_scores(78)
      student2.log_scores(59)
      student2.log_scores(78)

      expect(gradebook.students_below(80)).to eq([student2])
    end

    it 'can list students below a different threshold' do
      gradebook = Gradebook.new('Prof. McGonagall')
      course1 = Course.new('Calculus', 2)
      student1 = Student.new({ name: 'Harry', age: 21 })
      student2 = Student.new({ name: 'Ron', age: 21 })
      course1.enroll(student1)
      course1.enroll(student2)
      gradebook.add_course(course1)
      student1.log_scores(89)
      student1.log_scores(78)
      student2.log_scores(59)
      student2.log_scores(50)

      expect(gradebook.students_below(60)).to eq([student2])
    end
  end

  # Iteration 4
  describe 'all_grades' do
    it 'can list all grades' do
      gradebook = Gradebook.new('Prof. McGonagall')
      course1 = Course.new('Calculus', 2)
      course2 = Course.new('Computer Science', 3)
      student1 = Student.new({ name: 'Harry', age: 21 })
      student2 = Student.new({ name: 'Ron', age: 21 })
      course1.enroll(student1)
      course2.enroll(student2)
      gradebook.add_course(course1)
      gradebook.add_course(course2)
      student1.log_scores(89)
      student1.log_scores(78)
      student2.log_scores(59)
      student2.log_scores(50)

      expect(gradebook.all_grades).to eq({ course1 => [83.5], course2 => [54.5] })
    end
  end
end
