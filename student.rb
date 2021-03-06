require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    @classroom = classroom
    super(age, name, parent_permission)
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
