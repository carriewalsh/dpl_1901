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
    assert_equal [@fifth_season, @hundred_thousand_kingdoms], @nk_jemisin.books
  end
end
