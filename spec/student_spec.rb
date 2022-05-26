require './student'

describe Student do
  context 'basic initialisation of Student class' do
    name = 'Ben'
    age = '14'
    classroom = nil
    student = Student.new(age,classroom, name)

    it 'should be equal to student name' do
      expect(student.name).to eq 'Ben'
    end

    it 'should be equal to student age' do
      expect(student.age).to eq '14'
    end
  end
end