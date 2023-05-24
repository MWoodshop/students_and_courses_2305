require 'rspec'
require './lib/course'
require './lib/student'
require 'pry'

RSpec.describe Course do
  # Iteration 2
  describe 'initialize' do
    it 'can initialize' do
      course = Course.new('Calculus', 2)
      expect(course).to be_a(Course)
    end
    it 'returns correct values' do
      course = Course.new('Calculus', 2)
      expect(course.name).to eq('Calculus')
      expect(course.capacity).to eq(2)
    end
  end

  describe 'enroll' do
    it 'enroll students to a class' do
      course = Course.new('Calculus', 2)
      student1 = Student.new({ name: 'Morgan', age: 21 })
      student2 = Student.new({ name: 'Jordan', age: 29 })
      course.enroll(student1)
      course.enroll(student2)

      expect(course.students).to eq([student1, student2])
    end

    it 'tests full? is false by default' do
      course = Course.new('Calculus', 2)
      student1 = Student.new({ name: 'Morgan', age: 21 })
      student2 = Student.new({ name: 'Jordan', age: 29 })

      expect(course.full?).to eq(false)
    end

    it 'tests if students assigned to class equal or exceed capacity' do
      course = Course.new('Calculus', 2)
      student1 = Student.new({ name: 'Morgan', age: 21 })
      student2 = Student.new({ name: 'Jordan', age: 29 })
      course.enroll(student1)
      course.enroll(student2)

      expect(course.full?).to eq(true)
    end
  end
end
