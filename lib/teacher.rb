require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_reader :specialization

  def can_use_service?
    true
  end
end
