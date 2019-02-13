require './test/test_helper'
require "./lib/library"

class LibraryTest < Minitest::Test
  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    @dpl = Library.new
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
  end


  def test_library_exists
    assert_instance_of Library, @dpl
  end


  def test_library_starts_with_no_books
    lib = Library.new
    assert_equal [], lib.books
  end


  def test_library_can_have_books_added
    assert_equal [@fifth_season,@mockingbird,@kingdoms], @dpl.books
  end
end
