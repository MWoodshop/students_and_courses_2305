require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do
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
end
