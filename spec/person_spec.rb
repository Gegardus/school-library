require './person'

describe Person do
  context 'takes three parameters and returns a Person object with the correct arguments' do
    it 'should show new Person instance created' do
      person = Person.new(32, 'Ani', true)
      expect(person).to be_instance_of(Person)
    end

    it 'shows Person attributes values' do
      person = Person.new(32, 'Ani')
      expect(person.id).to be_between(0, 1000).inclusive
      expect(person.age).to eq 32
      expect(person.name).to eq 'Ani'
      expect(person.parent_permission).to be true
    end

    it 'shows parent_permission value' do
      person = Person.new(32, 'Ani', false)
      expect(person.parent_permission).to be false
    end

    it 'checks that can_use_services? method works correctly for false input' do
      person = Person.new(14, 'Milly', false)
      expect(person.can_use_services?).to be false
    end

    it 'it checks that can_use_services? method works correctly for true input' do
      person = Person.new(30, 'Leon', true)
      expect(person.can_use_services?).to be true
    end

    it 'it checks that correct_name method works correctly' do
      person = Person.new(30, 'Leon', true)
      expect(person.correct_name).to eq 'Leon'
    end
  end
end
