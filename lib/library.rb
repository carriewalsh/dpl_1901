class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.any? do |book|
      book.title == title
    end
  end

  def card_catalog
    no_the = @books.map do |book|
      book.title = book.title.split
      if book.title[0] == "The"
        book.title.shift
        book.title.join(" ")
      end
      book
    end
    titles_only = no_the.sort_by do |book|
      book.title
    end
    titles_only.sort_by do |book|
      book.author_last_name
    end
  end
end
