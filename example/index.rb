require_relative '../lib/metalpriceapi'

API_KEY = 'REPLACE_ME'

client = MetalpriceAPI::Client.new(api_key: API_KEY)

# Or use EU server:
# client = MetalpriceAPI::Client.new(api_key: API_KEY, server: 'eu')

data = client.fetchSymbols()
puts data

data = client.fetchLive('USD', ['XAU', 'XAG', 'XPD', 'XPT'], 'troy_oz')
puts data

data = client.fetchHistorical('2024-02-05', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'], 'troy_oz')
puts data

data = client.hourly('USD', 'XAU', 'troy_oz', '2025-11-03', '2025-11-03')
puts data

data = client.fetchOHLC('USD', 'XAU', '2024-02-06', 'troy_oz')
puts data

data = client.convert('USD', 'EUR', 100, '2024-02-05')
puts data

data = client.timeframe('2024-02-05', '2024-02-06', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'], 'troy_oz')
puts data

data = client.change('2024-02-05', '2024-02-06', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'])
puts data

data = client.carat('USD', 'XAU', '2024-02-06')
puts data

data = client.usage()
puts data
