[![Build Status](https://travis-ci.org/tonytonyjan/easycard.svg?branch=master)](https://travis-ci.org/tonytonyjan/easycard)

![](https://lh6.googleusercontent.com/-6-ErFtaeUO4/VUo3_zwW64I/AAAAAAAAE40/wZgBvNGYRSs/w2236-h618-no/Screen%2BShot%2B2015-05-06%2Bat%2B23.11.22_censored.jpg)

# 安裝

```
gem install easycard
```

# 使用指令

```
$ easycard -h
Usage: easycard CARD_ID [options]
    -m, --months=NUMBER              最近 n 月
    -d, --days=NUMBER                最近 n 天
    -j, --json                       以 JSON 格式顯示
    -y, --yaml                       以 YAML 格式顯示
    -f, --from=YYYY/MM/DD            起始時間
    -t, --to=YYYY/MM/DD              結束時間
    -h, --help                       顯示此訊息
```

```
$ easycard CARD_ID                         # 最近 1 個月的紀錄
$ easycard CARD_ID -j                      # 最近 1 個月的紀錄，以 JSON 呈現
$ easycard CARD_ID -m 3                    # 最近 3 個月的紀錄
$ easycard CARD_ID -d 3                    # 最近 3 個月的紀錄
$ easycard CARD_ID -f 2015/4/4 -t 2015/5/5 # 從 4 月 4 日至 5 月 5 日的紀錄
```

# 使用 Ruby

```ruby
require 'easycard'
response = EasyCard.query CARD_NUMBER
response.raw_data # 原始資料
response.data     # 陣列
response.to_s     # 表格字串
response.to_json  # JSON 格式的字串
response.to_yaml  # YAML 格式的字串

EasyCard.query CARD_NUMBER, from: Date.today-30, to: Date.today
```