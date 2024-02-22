require_relative '../lib/metalpriceapi'

API_KEY = 'REPLACE_ME'

MetalpriceAPI::VERSION

client = MetalpriceAPI::Client.new(
  api_key: API_KEY
)

data = client.fetchSymbols()
puts data

data = client.fetchLive()
puts data

data = client.fetchHistorical('2021-04-05', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'])
puts data

data = client.convert('USD', 'EUR', 100, '2021-04-05')
puts data

data = client.timeframe('2021-04-05', '2021-04-06', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'])
puts data

data = client.change('2021-04-05', '2021-04-06', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'])
puts data

data = client.carat('USD', '2021-04-06')
puts data