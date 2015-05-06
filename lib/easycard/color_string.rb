module EasyCard
  module ColorString
    refine String do
      def bold;  "\033[1m#{self}\033[22m" end
      def red;  "\033[31m#{self}\033[0m" end
      def green; "\033[32m#{self}\033[0m" end
      def yellow;  "\033[33m#{self}\033[0m" end
    end
  end
end