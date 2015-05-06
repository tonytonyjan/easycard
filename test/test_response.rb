require 'minitest/autorun'
require 'easycard/response'

class TestResponse < Minitest::Test
  def setup
    data = '[{"T":"D","D":"2015-05-04 19:56:24","L":"中興客運","Q":"6","A":"806"},{"T":"U","D":"2015-05-01 16:34:46","L":"國泰世華","Q":"1000","A":"990"},{"B":"123"}]'
    @response = EasyCard::Response.new(data)
  end

  def test_as
    assert_equal @response.to_json, @response.as(:json)
    assert_equal @response.to_yaml, @response.as(:yaml)
    assert_equal @response.to_s, @response.as(:table)
    assert_equal @response.data, @response.as(nil)
  end

  def test_to_a
    expected =  [
      {
        type: :withdrawal,
        datetime: "2015-05-04 19:56:24",
        location: "中興客運",
        balance: "806",
        amount: "6"
      },
      {
        type: :deposit,
        datetime: "2015-05-01 16:34:46",
        location: "國泰世華",
        balance: "990",
        amount: "1000"
      }
    ]
    assert_equal expected, @response.to_a
    assert_equal expected, @response.data
  end

  def test_to_s
    expected = "  # | 時間                | 種類 | 金額  | 餘額  | 地點
--- | ------------------- | ---- | ----- | ----- | --------------------
  1 | 2015-05-04 19:56:24 | \e[1m\e[31m扣款\e[0m\e[22m |     6 |   806 | 中興客運
  2 | 2015-05-01 16:34:46 | \e[1m\e[32m儲值\e[0m\e[22m |  1000 |   990 | 國泰世華
"
    assert_equal expected, @response.to_s
  end

  def test_balance
    assert_equal 123, @response.balance
  end
end