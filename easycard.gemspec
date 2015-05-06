Gem::Specification.new do |s|
  s.name        = 'easycard'
  s.version     = '1.0.0'
  s.licenses    = ['MIT']
  s.summary     = '台灣悠遊卡餘額查詢 Taiwan EasyCard Searcher'
  s.description = '台灣悠遊卡餘額查詢，可查詢悠遊卡交易紀錄 Taiwan EasyCard Searcher'
  s.authors     = 'Jian Weihang'
  s.email       = 'tonytonyjan@gmail.com'
  s.homepage    = 'https://github.com/tonytonyjan/easycard'
  s.files       = Dir['lib/**/*.rb']
  s.executables = 'easycard'
  s.add_development_dependency 'rake', '~> 0'
end