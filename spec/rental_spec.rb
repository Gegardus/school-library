require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'add a new rental' do
    it 'rental has attributes' do
      date = '2022-04-20'
      book = Book.new('Book', 'Author')
      person = Person.new(32, 'Ani')

      rental = Rental.new(date, person, book)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.person.name).to eql('Ani')
      expect(rental.person.age).to eql(32)
      expect(rental.book.title).to eql('Book')
      expect(rental.book.author).to eql('Author')
    end

    it 'the add_rental method returns a rental' do
      book = Book.new('Title', 'Author')
      person = Person.new(34, 'Milly')

      rental = person.add_rental('2022-04-20', book)

      expect(person.rentals).to eq [rental]
    end
  end
end
