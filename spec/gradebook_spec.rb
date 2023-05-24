require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'
require 'pry'

# Iteration 3
RSpec.describe Gradebook do
  describe 'initialize' do
    it 'can initialize' do
      gradebook = Gradebook.new('Prof. McGonagall')
      expect(gradebook).to be_a(Gradebook)
    end
  end
end
