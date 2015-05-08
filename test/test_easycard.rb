require 'minitest/autorun'
require 'easycard'

class TestEasyCard < Minitest::Test

  def test_normalize_time
    assert_equal '1989-11-23', EasyCard.normalize_time(Time.new(1989, 11, 23))
    assert_equal '1989-11-23', EasyCard.normalize_time('1989/11/23')
  end

  def test_verify
    assert_equal 'DBDDF375224AD0D44D196B29F5DFF388', EasyCard.verify(Time.new(1989, 11, 23, 11))
  end

  def test_card_id
    assert_equal 'vZUFVzXEjqYd7aCOtA6rQA==', EasyCard.card_id(ENV['CARD_NUMBER'])
  end

  def test_query
    expected = [
      {type: :withdrawal, datetime: "2015-04-01 20:08:36", location: "三重客運", balance: "878", amount: "6"},
      {type: :withdrawal, datetime: "2015-04-01 19:54:58", location: "捷運 - 亞東醫院", balance: "884", amount: "32"},
      {type: :withdrawal, datetime: "2015-04-01 10:04:18", location: "中興客運", balance: "916", amount: "12"},
      {type: :withdrawal, datetime: "2015-04-01 09:23:53", location: "台鐵 - 臺鐵松山車站", balance: "928", amount: "25"}
    ]
    response = EasyCard.query ENV['CARD_NUMBER'], from: Time.new(2015,4,1), to: Time.new(2015,4,1)
    assert_equal expected, response.data
  rescue SocketError
    skip 'This run requires network, make sure you have ability to connect to internet.'
  end
end