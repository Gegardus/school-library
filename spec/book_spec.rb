require_relative '../book'

describe Book do
  context 'takes two parameters and returns a Book object with the correct arguments' do
    before(:each) do
      title = 'Fahrenheit 451'
      author = 'Ray Bradbury'
      @book = Book.new(title, author)
    end

    it 'if it is instance of class' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'defines book title' do
      expect(@book.title).to eq('Fahrenheit 451')
    end

    it 'defines book author' do
      expect(@book.author).to eq('Ray Bradbury')
    end
  end
end
