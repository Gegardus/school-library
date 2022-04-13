require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission)
  end

  def can_use_services?
    true
  end
end