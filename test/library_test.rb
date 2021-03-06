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
    assert_equal [@fifth_season, @mockingbird, @kingdoms], @dpl.books
  end


  def test_library_can_check_books_it_has
    assert_equal true, @dpl.include?("To Kill a Mockingbird")
    assert_equal false, @dpl.include?("Grapes of Wrath")
  end


  def test_library_has_catalog_by_authors_last_name
    assert_equal [@fifth_season,@kingdoms,@mockingbird], @dpl.card_catalog
  end


  def test_library_card_catalog_ignores_first_word_the
    @great = @nk_jemisin.add_book("Great Book", "2010")
    @dpl.add_to_collection(@great)
    assert_equal [@fifth_season, @great, @kingdoms, @mockingbird], @dpl.card_catalog
  end


  def test_library_starts_with_no_authors
    lib = Library.new
    assert_equal ({}), lib.authors
  end


  def test_library_has_has_of_authors
    assert_equal ({"N.K. Jemisin" => [@fifth_season, @kingdoms],
        "Harper Lee" => [@mockingbird]}), @dpl.authors
  end


  def test_library_can_find_by_author
    assert_equal ({ "The Fifth Season" => @fifth_season,
          "The Hundred Thousand Kingdoms"  => @kingdoms}), @dpl.find_by_author("N.K. Jemisin")
  end


  def test_library_can_find_by_publication_date
    skip
    assert_equal ({"To Kill a Mockingbird" => @mockingbird}), @dpl.find_by_publication_date("1960")
  end
end
