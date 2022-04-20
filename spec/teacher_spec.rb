require_relative '../teacher'

describe Teacher do
  context 'takes three parameters and returns a Teacher object with the correct arguments' do
    before(:each) do
      age = 55
      name = 'John'
      specialization = 'Programming'
      @teacher = Teacher.new(age, specialization, name)
    end

    it 'if is instance of class' do
      expect(@teacher.instance_of?(Teacher)) == true
    end

    it 'if is right age' do
      expect(@teacher.age).to eq 55
    end

    it 'if is right name' do
      expect(@teacher.name).to eq 'John'
    end

    it 'if is correct socialization' do
      expect(@teacher.specialization).to eq 'Programming'
    end

    it 'if can rent a book' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
