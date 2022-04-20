require './student'

describe Student do
  context 'returns a Student object with the correct attributes' do
    it 'shows student attributes values' do
      student_1 = Student.new(55, 'Ruby', 'Vahan', true)
      expect(student_1.age).to eq 55
      expect(student_1.classroom).to eq 'Ruby'
      expect(student_1.name).to eq 'Vahan'
      expect(student_1.parent_permission).to be true
    end

    it 'The student has classroom algo_ds' do
      student_1 = Student.new(55, 'Ruby', 'Vahan', true)
      algo_ds = Classroom.new('algo_ds')
      student_1.classroom = algo_ds

      expect(student_1.classroom.label).to eq 'algo_ds'
      expect(algo_ds.students.count).to eq 1
    end
  end
end
