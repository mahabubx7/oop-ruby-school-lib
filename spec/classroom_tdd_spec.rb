require_relative '../lib/student'
require_relative '../lib/classroom'

describe 'Unit tests for "Classroom" class' do
  classroom = Classroom.new('OOP')
  student = Student.new('Mahabub')

  it 'should add a student to the classroom' do
    classroom.add_student(student)
    expect(classroom.students).to include(student)
  end

  it 'should sets the classroom for the student' do
    classroom.add_student(student)
    expect(student.classroom).to eq(classroom)
  end
end
