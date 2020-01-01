require 'spec_helper'
require 'json'
require './app/services/bitcoin_service'

describe 'Currency' do
  it 'exchange' do
    amount = rand(0..9999)
    res = BitcoinService.new("BRL", amount).perform
    expect(res.is_a? String).to eql(false)
    expect(res != 0 || amount == 0).to eql(true)
  end
end
