require './capitalize'
require './student'

describe 'capitalize name' do
  context 'test capitalize name' do
    it 'should expect to capitalize name' do
      student = Student.new(15, nil, 'bonke')
      decorated_student = CapitalizeDecorator.new(student)
      expect(decorated_student.correct_name).to eq('Bonke')
    end
  end
end
