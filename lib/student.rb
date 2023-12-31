require_relative 'person'

class Student < Person
  attr_accessor :name, :classroom

  def initialize(name = 'Unknown', age = nil, classroom = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
