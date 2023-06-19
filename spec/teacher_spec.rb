require_relative '../lib/teacher'

describe 'Unit tests for "Teacher" class' do
  it 'should be able to get parent properties' do
    teacher = Teacher.new('OOP', 25, 'Mahabub')
    teacher2 = Teacher.new('OOP', 17, 'Mahabub2', false)

    expect(teacher.name).to eq('Mahabub')
    expect(teacher2.name).to eq('Mahabub2')

    expect(teacher.age).to eq(25)
    expect(teacher2.age).to eq(17)
  end

  it 'should return specialization info' do
    teacher = Teacher.new('OOP', 25, 'Mahabub')
    expect(teacher.specialization).to eq('OOP')
  end

  it 'should return can_use_service? always true' do
    teacher = Teacher.new('OOP', 25, 'Mahabub')
    expect(teacher.can_use_service?).to eq(true)
  end
end