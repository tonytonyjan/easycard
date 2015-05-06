module EasyCard
  module ColorString
    module_function
    def bold(str);  "\033[1m#{str}\033[22m" end
    def red(str);  bold("\033[31m#{str}\033[0m") end
    def green(str); bold("\033[32m#{str}\033[0m") end
    def yellow(str);  bold("\033[33m#{str}\033[0m") end
  end
end