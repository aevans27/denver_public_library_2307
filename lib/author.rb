class Author
  attr_reader :name, :books
  def initialize(author_data)
    @name = "#{author_data[:first_name]} #{author_data[:last_name]}"
    @books = []
  end

  def write(title, date)
    split_name = @name.split
    new_books = Book.new({author_first_name: split_name.first, author_last_name: split_name.last, title: title, publication_date: date})
    @books << new_books
    new_books
  end
end