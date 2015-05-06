require 'easycard/version'
Gem::Specification.new do |s|
  s.name        = 'easycard'
  s.version     = EasyCard::VERSION
  s.licenses    = ['MIT']
  s.summary     = '台灣悠遊卡交易紀錄查詢工具/A search tool for Taiwan EasyCard'
  s.description = <<EOS
台灣悠遊卡交易紀錄查詢工具，支援指令模式。
A search tool for Taiwan EasyCard, supporting CLI mode.
EOS
  s.authors     = 'Jian Weihang'
  s.email       = 'tonytonyjan@gmail.com'
  s.homepage    = 'https://github.com/tonytonyjan/easycard'
  s.files       = Dir['lib/**/*.rb']
  s.executables = 'easycard'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'minitest', '~> 5.6'
end