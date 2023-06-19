require_relative '../lib/student'

describe 'Unit tests for "Student" class' do
  it 'should be able to get parent properties' do
    student1 = Student.new('C101', 'Mahabub', 25)
    student2 = Student.new('C101', 'Mahabub2', 17, parent_permission: false)

    expect(student1.name).to eq('Mahabub')
    expect(student2.name).to eq('Mahabub2')

    expect(student1.age).to eq(25)
    expect(student2.age).to eq(17)

    expect(student1.can_use_service?).to be_truthy
    expect(student2.can_use_service?).to be_falsey
  end

  it 'should return classroom info' do
    student1 = Student.new('C101', 'Mahabub', 25)
    expect(student1.classroom).to eq('C101')
  end

  it 'should return slimley string by calling play_hooky?' do
    student1 = Student.new('C101', 'Mahabub', 25)
    expect(student1.play_hooky).to eq('¯\(ツ)/¯')
  end
end
