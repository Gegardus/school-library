require './student'

describe Student do
  context 'returns a Student object with the correct attributes' do
    it 'shows student attributes values' do
      student = Student.new(55, 'Ruby', 'Vahan', true)
      expect(student.age).to eq 55
      expect(student.classroom).to eq 'Ruby'
      expect(student.name).to eq 'Vahan'
      expect(student.parent_permission).to be true
    end

    it 'The student has classroom algo_ds' do
      student = Student.new(55, 'Ruby', 'Vahan', true)
      algo_ds = Classroom.new('algo_ds')
      student.classroom = algo_ds

      expect(student.classroom.label).to eq 'algo_ds'
      expect(algo_ds.students.count).to eq 1
    end
  end
end
