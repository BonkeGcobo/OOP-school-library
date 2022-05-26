require './person'

describe Person do
  context 'Test initialization' do
    it 'gets initialize only with age' do
      person = Person.new(14, 'Bonke')
      expect(person.age).to be 14
      expect(person.name).to eq 'Bonke'
      expect(person.find_id).to be > 0
    end
  end
end
