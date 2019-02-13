require './test/test_helper'
require "./lib/author"

class AuthorTest < Minitest::Test
  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
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
end
