require 'minitest/autorun'
require 'easycard'

class TestEasyCard < Minitest::Test
  def test_verify
    assert_equal 'DBDDF375224AD0D44D196B29F5DFF388', EasyCard.verify(Time.new(1989, 11, 23, 11))
  end

  def test_card_id
    assert_equal 'vZUFVzXEjqYd7aCOtA6rQA==', EasyCard.card_id(ENV['CARD_NUMBER'])
  end
end