require_relative '../lib/person'

describe 'Unit tests for "Person" class' do
  it 'should return name & age' do
    person1 = Person.new('Mahabub', 25)
    person2 = Person.new('Mahabub2', 17)

    expect(person1.name).to eq('Mahabub')
    expect(person1.age).to eq(25)

    expect(person2.name).to eq('Mahabub2')
    expect(person2.age).to eq(17)
  end

  it 'should create unique id for each person' do
    person1 = Person.new('Mahabub', 25)
    person2 = Person.new('Mahabub2', 17)
    expect(person1.id == person2.id).to be_falsey
  end

  it 'should check person can_use_service?' do
    person1 = Person.new('Mahabub', 25)
    person2 = Person.new('Mahabub2', 18, parent_permission: false)
    person3 = Person.new('Mahabub2', 17, parent_permission: false)
    expect(person1.can_use_service?).to be_truthy
    expect(person2.can_use_service?).to be_truthy
    expect(person3.can_use_service?).to be_falsey
  end
end
