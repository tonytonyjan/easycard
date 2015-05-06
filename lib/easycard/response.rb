require 'easycard/color_string'
require 'json'
require 'yaml'
require 'forwardable'

module EasyCard
  class Response
    extend Forwardable

    attr_reader :data, :raw_data, :parsed_data, :balance
    def_delegators :@data, :to_json, :to_yaml, :to_a

    def self.normalize_record record
      type = case record[?T]
      when ?D then :withdrawal
      when ?U then :deposit
      when '罰款' then :fine
      when '查無交易資料' then raise EasyCard::NotFound, record[?T]
      else raise EasyCard::Error, "未知類型: #{record[?T]}，#{record}"
      end
      record[?L].gsub!('<BR>', ?-)
      {type: type, datetime: record[?D], location: record[?L], balance: record[?A], amount: record[?Q]}
    end

    def self.type_text type
      case type
      when :withdrawal then EasyCard::ColorString.red('扣款')
      when :deposit then EasyCard::ColorString.green('儲值')
      when :fine then EasyCard::ColorString.yellow('罰款')
      end
    end

    def initialize raw_data
      @raw_data = raw_data
      @parsed_data = JSON.parse(@raw_data)
      @balance = @parsed_data.pop[?B].to_i if @parsed_data.last[?B]
      @data = @parsed_data.map do |record|
        self.class.normalize_record(record)
      end
    end

    def as format = nil
      case format
      when :json then to_json
      when :yaml then to_yaml
      when :table then to_s
      else data
      end
    end

    def to_s
      ret = "%3s | %-17s | %s | %-3s | %-3s | %s\n" % %w[# 時間 種類 金額 餘額 地點]
      ret << "#{?-*3} | #{?-*19} | #{?-*4} | #{?-*5} | #{?-*5} | #{?-*20}\n"
      @data.each_with_index.map{|record, i| ret << line(i+1, record) << $/}
      ret
    end

    def line id, record
      type = self.class.type_text(record[:type])
      '%3d | %19s | %s | %5s | %5s | %s' % [id, record[:datetime], type, record[:amount], record[:balance], record[:location]]
    end

  end
end