require 'rest-client'
require 'json'

class BitcoinService
  def initialize(target_currency, amount)
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def perform
    begin
      base_url = "https://blockchain.info/tobtc?currency=#{@target_currency}&value=#{@amount}"
      response = RestClient.get base_url
      value = JSON.parse(response.body)

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
