require_relative '../lib/person'

describe 'Unit tests for "Person" class' do
  it 'should return name & age' do
    person1 = Person.new(25, 'Mahabub')
    person2 = Person.new(17, 'Mahabub2')

    expect(person1.name).to eq('Mahabub')
    expect(person1.age).to eq(25)
    
    expect(person2.name).to eq('Mahabub2')
    expect(person2.age).to eq(17)
  end

  it 'should create unique id for each person' do
    person1 = Person.new(25, 'Mahabub')
    person2 = Person.new(17, 'Mahabub2')
    expect(person1.id == person2.id).to eq(false)
  end

  it 'should check person can_use_service?' do
    person1 = Person.new(25, 'Mahabub')
    person2 = Person.new(17, 'Mahabub2', false)
    expect(person1.can_use_service?).to eq(true)
    expect(person2.can_use_service?).to eq(false)
  end
end