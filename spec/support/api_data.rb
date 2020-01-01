RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /currencydatafeed.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "status": true,
        "currency": [
            {
                "currency": "USD/BRL",
                "value": "3.41325",
                "date": "2018-04-20 17:22:59",
                "type": "original"
            }
        ]
      }', headers: {})

      stub_request(:get, /blockchain.info/ )
      .with(headers: {
        'Accept'=>'*/*'
      }).to_return(status: 200, body: '
        {
          "status": true,
          "currency": [
              {
                  "currency": "USD",
                  "15m": 7201.28,
                  "last": 7201.28,
                  "buy": 7201.28,
                  "sell": 7201.28,
                  "symbol": "$"
              }
          ]
        }', headers: {})
  end
end
