require_relative '../lib/person'
require_relative '../lib/trimmer_decorator'
require_relative '../lib/capitalize_decorator'

describe 'Unit tests for "Decorators"' do
  it 'should have working correct_name method' do
    person = Person.new('mahabub', 25)
    expect(person.correct_name).to eq('mahabub')
  end

  it 'should return capitalize name' do
    person = Person.new('mahabub', 25)
    caps_name = CapitalizeDecorator.new(person)
    expect(caps_name.correct_name).to eq('Mahabub')
  end

  it 'should return trimmed name' do
    person1 = Person.new('Mahabub A.', 25)
    person2 = Person.new('Mahabub Alam', 25)
    trimmed_name1 = TrimmerDecorator.new(person1)
    trimmed_name2 = TrimmerDecorator.new(person2)
    expect(trimmed_name1.correct_name).to eq('Mahabub A.')
    expect(trimmed_name2.correct_name).to eq('Mahabub Al')
  end
end
