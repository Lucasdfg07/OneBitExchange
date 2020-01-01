require 'rest-client'
require 'json'

class BitcoinService
  def initialize(target_currency, amount)
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def perform
    begin
      base_url = "http://blockchain.info/ticker"
      response = RestClient.get base_url
      data = JSON.load response
      cool = data[@target_currency]
      value = JSON.pretty_generate cool["last"]

      @numero = value.to_f

      @numero * @amount
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
