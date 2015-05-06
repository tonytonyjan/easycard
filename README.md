智慧卡公司對悠遊卡進行加密來禁止對卡片直接的餘額讀取功能，官方提供的查詢程式又僅支援少部分手機，且未對外開放 API 供大眾使用，[甚至有人發表了 python 版，卻仍不願開源](https://github.com/x43x61x69/Easy-Card)，十分不便。

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
$ easycard CARD_ID                          # 最近 1 個月的紀錄
$ easycard CARD_ID -j                       # 最近 1 個月的紀錄，以 JSON 呈現
$ easycard CARD_ID -m 3                     # 最近 3 個月的紀錄
$ easycard CARD_ID -d 3                     # 最近 3 個月的紀錄
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

EasyCard.query CARD_NUMBER, from: Date.today-30, to: Date.today, format: :json
```