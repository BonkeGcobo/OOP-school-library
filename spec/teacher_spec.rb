require './teacher'

describe Teacher do
  context 'Test initialization' do
    it 'gets initialize only with specialization and age' do
      specialization = 'Math'
      age = '36'
      teacher = Teacher.new(age, specialization)

      expect(teacher.age).to eq age
      expect(teacher.name).to eq 'unknown'
    end

    it 'can use service' do
      specialization = 'Math'
      age = '36'
      teacher = Teacher.new(age, specialization)

      expect(teacher.can_use_services?).to be true
    end
  end
end
