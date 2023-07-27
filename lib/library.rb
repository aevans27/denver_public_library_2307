class Library
  attr_reader :name, :authors, :books, :checked_out_books
  def initialize(name)
    @name = name
    @authors = []
    @books = []
    @checked_out_books = []
    @popular_books = {}
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def publication_time_frame_for(author)
    authors_books = @books.find_all do |book|
      book.author == author.name
    end
    book_years = []
    authors_books.each do |years|
      book_years << years.publication_year
    end
    
    high = book_years.max()
    low = book_years.min()

    {start: low, end: high}
  end

  def checkout(book)
    if @books.include?(book)
      @checked_out_books << book
      @books.delete(book)
      if @popular_books[book] == nil
        @popular_books[book] = 1
      else
        @popular_books[book] += 1
      end
      true
    else
      false
    end
  end

  def return(book)
    if !@books.include?(book) && @checked_out_books.include?(book)
      @checked_out_books.delete(book)
      @books << book
    end
  end

  def most_popular_book
    most_pop_book = @popular_books.max_by do |k,v|
      v
    end
    most_pop_book.first
  end
end