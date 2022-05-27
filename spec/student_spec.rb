require './student'

describe Student do
  context 'basic initialisation of Student class' do
    name = 'Ben'
    age = '14'
    classroom = nil
    parent_permission = false
    student = Student.new(age, classroom, name, parent_permission: parent_permission)

    it 'should be equal to student name' do
      expect(student.name).to eq 'Ben'
    end

    it 'should be equal to student age' do
      expect(student.age).to eq '14'
    end

    it 'Test if Student can use services' do
      expect(student.can_use_services?).to be false
    end
  end
end
