require './classroom'
require './student'

describe Classroom do
  context 'sets classroom' do
    it "shows label 'algo_ds' " do
      algo_ds = Classroom.new('algo_ds')
      expect(algo_ds.label).to eq 'algo_ds'
    end

    it 'the add_student method returns Student object with the correct attributes' do
      student = Student.new(55, 'algo_ds', 'Vahan', true)

      algo_class = Classroom.new('algo_ds')
      algo_class.add_student(student)

      expect(algo_class.students[0].name).to eq 'Vahan'
    end
  end
end
