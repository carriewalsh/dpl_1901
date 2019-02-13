require './test/test_helper'
require "./lib/author"

class AuthorTest < Minitest::Test
  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
  end


  def test_author_exists
    assert_instance_of Author, @nk_jemisin
  end


  def test_author_has_first_name
    assert_equal "N.K.", @nk_jemisin.first_name
  end


  def test_author_has_last_name
    assert_equal "Jemisin", @nk_jemisin.last_name
  end


  def test_author_starts_with_no_books_by_default
    author = Author.new({first_name: "Namey", last_name: "Name"})
    assert_equal [], author.books
  end


  def test_author_can_have_books_added
    @nk_jemisin.add_book("The Broken Kingdoms","November 3, 2010")
    assert_equal 3, @nk_jemisin.books.count
    assert_equal "The Fifth Season", @nk_jemisin.books.first.title
    assert_equal "The Broken Kingdoms", @nk_jemisin.books.last.title
  end
end
