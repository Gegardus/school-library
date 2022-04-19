require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end

  def to_s
    puts "Teacher age #{age} name #{name} specialization #{@specialization} permission #{@parent_permission}"
  end
end

# teacher = Teacher.new(45, "geography")

# puts teacher.to_s