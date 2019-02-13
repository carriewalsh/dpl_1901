class Library
  attr_reader :books,
      :authors

  def initialize
    @books = []
    @authors = Hash.new {|hash,key| hash[key] = []}
  end

  def add_to_collection(book)
    @books << book
    @authors["#{book.author_first_name} #{book.author_last_name}"] << book
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

  def find_by_author(author)
    books = []
    if @authors.include?(author)
      books = @authors[author]
    end
    books.flatten!
    hash = books.group_by do |book|
      book.title
    end
  end
end
