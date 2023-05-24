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
end
