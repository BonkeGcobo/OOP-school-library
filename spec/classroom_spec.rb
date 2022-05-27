require './classroom'
require './student'

describe Classroom do
  context 'basic initialization of Classroom class' do
    label = 'Math'
    classroom = Classroom.new(label)

    it 'should expect label equal to Math' do
      expect(classroom.label).to be label
    end

    it 'should expect the student array empty' do
      expect(classroom.students).to eq([])
    end
  end
end
