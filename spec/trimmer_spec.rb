require './trimmer'
require './person'

describe TrimmerDecorator do
  context 'test trimmer decorator' do
    it 'check trimming works' do
      name = 'I_am_a_super_duper_programmer'
      age = 1
      person = Person.new(age, name)
      trimmed_person = TrimmerDecorator.new(person)
      expected_name = 'I_am_a_sup'

      expect(trimmed_person.correct_name).to eq expected_name
    end
  end
end