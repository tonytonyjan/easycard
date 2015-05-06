require 'easycard/response'
require 'openssl'
require 'cgi'
require 'base64'
require 'net/http'

module EasyCard
  KEY = 'EasyCardToKingay23456789'
  IV = '01234567'
  SALT = 'L0CalKing'
  CONST = 8544

  class Error < RuntimeError; end

  module_function

  def query cart_number, from: Date.today-30, to: Date.today, format: nil
    query_hash = {
      cardID: card_id(cart_number),
      begin: from.strftime('%Y-%m-%d'),
      end: to.strftime('%Y-%m-%d'),
      verify: verify,
      ev: 1
    }
    uri = URI('https://wallet.easycard.com.tw/EasyWallet/QueryManager/V3/GetTXNThinDataInfo')
    uri.query = URI.encode_www_form(query_hash)
    Response.new(Net::HTTP.get(uri))
  end

  def card_id card_number
    remainder = card_number.size % 16
    data = card_number + "\x06"*(16 - remainder) if remainder != 0
    cipher = OpenSSL::Cipher.new('DES3')
    cipher.encrypt
    cipher.key = KEY
    cipher.iv = IV
    Base64.encode64(cipher.update(data)).chop!
  end

  def verify time = Time.now
    seed = time.month + time.day + time.hour
    Digest::MD5.hexdigest("#{seed * CONST}#{SALT}").upcase!
  end
end
