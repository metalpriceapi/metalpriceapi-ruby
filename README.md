# metalpriceapi

metalpriceapi is the official Ruby wrapper for MetalpriceAPI.com. This allows you to quickly integrate our metal price API and foreign exchange rate API into your application. Check https://metalpriceapi.com documentation for more information.

## Installation
Add to Gemfile.

```
gem 'metalpriceapi'
```

## Usage

```ruby

api_key = 'SET_YOUR_API_KEY_HERE'
client = MetalpriceAPI::Client.new(api_key: api_key)

# Or use EU server:
# client = MetalpriceAPI::Client.new(api_key: api_key, server: 'eu')
```
---
## Server Regions

MetalpriceAPI provides two regional endpoints. Choose the one closest to your servers for optimal performance.

| Region | Base URL |
|--------|----------|
| United States (default) | `https://api.metalpriceapi.com/v1` |
| Europe | `https://api-eu.metalpriceapi.com/v1` |

```ruby
# Default (US)
client = MetalpriceAPI::Client.new(api_key: 'SET_YOUR_API_KEY_HERE')

# Europe
client = MetalpriceAPI::Client.new(api_key: 'SET_YOUR_API_KEY_HERE', server: 'eu')
```

---
## Documentation

#### fetchSymbols()
```ruby
client.fetchSymbols()
```

[Link](https://metalpriceapi.com/documentation#api_symbol)

---
#### setServer(server)

- `server` <[string]> Pass `'eu'` to use the EU server (`api-eu.metalpriceapi.com`), or `'us'` for the US server. Defaults to US if not specified.

```ruby
client.setServer('eu')
```

---
#### fetchLive(base, currencies, unit, purity, math)

- `base` <[string]> Optional. Pass in a base currency, defaults to USD.
- `currencies` <[Array]<[string]>> Optional. Pass in an array of currencies to return values for.
- `unit` <[string]> Optional. Pass in a unit for metal prices (e.g. `troy_oz`, `gram`, `kilogram`).
- `purity` <[string]> Optional. Pass in a purity level for metal prices.
- `math` <[string]> Optional. Pass in a math expression to apply to the rates.

```ruby
client.fetchLive('USD', ['XAU', 'XAG', 'XPD', 'XPT'], 'troy_oz')
```

[Link](https://metalpriceapi.com/documentation#api_realtime)

---
#### fetchHistorical(date, base, currencies, unit)

- `date` <[string]> Required. Pass in a string with format `YYYY-MM-DD`
- `base` <[string]> Optional. Pass in a base currency, defaults to USD.
- `currencies` <[Array]<[string]>> Optional. Pass in an array of currencies to return values for.
- `unit` <[string]> Optional. Pass in a unit for metal prices (e.g. `troy_oz`, `gram`, `kilogram`).

```ruby
client.fetchHistorical('2024-02-05', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'], 'troy_oz')
```

[Link](https://metalpriceapi.com/documentation#api_historical)

---
#### hourly(base, currency, unit, start_date, end_date, math, date_type)

- `base` <[string]> Optional. Pass in a base currency, defaults to USD.
- `currency` <[string]> Required. Specify currency you would like to get hourly rates for.
- `unit` <[string]> Optional. Pass in a unit for metal prices (e.g. `troy_oz`, `gram`, `kilogram`).
- `start_date` <[string]> Required. Specify the start date using the format `YYYY-MM-DD`.
- `end_date` <[string]> Required. Specify the end date using the format `YYYY-MM-DD`.
- `math` <[string]> Optional. Pass in a math expression to apply to the rates.
- `date_type` <[string]> Optional. Pass in a date type, overrides date parameters if passed in.

```ruby
client.hourly('USD', 'XAU', 'troy_oz', '2025-11-03', '2025-11-03')
```

[Link](https://metalpriceapi.com/documentation#api_hourly)

---
#### fetchOHLC(base, currency, date, unit, date_type)

- `base` <[string]> Optional. Pass in a base currency, defaults to USD.
- `currency` <[string]> Required. Specify currency you would like to get OHLC for.
- `date` <[string]> Required. Specify date to get OHLC for specific date using format `YYYY-MM-DD`.
- `unit` <[string]> Optional. Pass in a unit, defaults to troy_oz.
- `date_type` <[string]> Optional. Pass in a date type, overrides date parameter if passed in.

```ruby
client.fetchOHLC('USD', 'XAU', '2024-02-06', 'troy_oz')
```

[Link](https://metalpriceapi.com/documentation#api_ohlc)

---
#### convert(from_currency, to_currency, amount, date, unit)

- `from_currency` <[string]> Optional. Pass in a base currency, defaults to USD.
- `to_currency` <[string]> Required. Specify currency you would like to convert to.
- `amount` <[number]> Required. The amount to convert.
- `date` <[string]> Optional. Specify date to use historical midpoint value for conversion with format `YYYY-MM-DD`. Otherwise, it will use live exchange rate date if value not passed in.
- `unit` <[string]> Optional. Pass in a unit for metal prices (e.g. `troy_oz`, `gram`, `kilogram`).

```ruby
client.convert('USD', 'EUR', 100, '2024-02-05')
```

[Link](https://metalpriceapi.com/documentation#api_convert)

---
#### timeframe(start_date, end_date, base, currencies, unit)

- `start_date` <[string]> Required. Specify the start date of your timeframe using the format `YYYY-MM-DD`.
- `end_date` <[string]> Required. Specify the end date of your timeframe using the format `YYYY-MM-DD`.
- `base` <[string]> Optional. Pass in a base currency, defaults to USD.
- `currencies` <[Array]<[string]>> Optional. Pass in an array of currencies to return values for.
- `unit` <[string]> Optional. Pass in a unit for metal prices (e.g. `troy_oz`, `gram`, `kilogram`).

```ruby
client.timeframe('2024-02-05', '2024-02-06', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'], 'troy_oz')
```

[Link](https://metalpriceapi.com/documentation#api_timeframe)

---
#### change(start_date, end_date, base, currencies, date_type)

- `start_date` <[string]> Required. Specify the start date of your timeframe using the format `YYYY-MM-DD`.
- `end_date` <[string]> Required. Specify the end date of your timeframe using the format `YYYY-MM-DD`.
- `base` <[string]> Optional. Pass in a base currency, defaults to USD.
- `currencies` <[Array]<[string]>> Optional. Pass in an array of currencies to return values for.
- `date_type` <[string]> Optional. Pass in a date type, overrides date parameters if passed in.

```ruby
client.change('2024-02-05', '2024-02-06', 'USD', ['XAU', 'XAG', 'XPD', 'XPT'])
```

[Link](https://metalpriceapi.com/documentation#api_change)

---
#### carat(base, currency, date)

- `base` <[string]> Optional. Pass in a base currency, defaults to USD.
- `currency` <[string]> Optional. Pass in a metal code to get carat prices for (defaults to XAU).
- `date` <[string]> Optional. Specify date to get Carat for specific date using format `YYYY-MM-DD`. If not specified, uses live rates.

```ruby
client.carat('USD', 'XAU', '2024-02-06')
```

[Link](https://metalpriceapi.com/documentation#api_carat)

---
#### usage()

```ruby
client.usage()
```

[Link](https://metalpriceapi.com/documentation#api_usage)

---
**[Official documentation](https://metalpriceapi.com/documentation)**

---
## FAQ

- How do I get an API Key?

    Free API Keys are available [here](https://metalpriceapi.com).

- I want more information

    Checkout our FAQs [here](https://metalpriceapi.com/faq).


## Support

For support, get in touch using [this form](https://metalpriceapi.com/contact).


[Array]: https://www.geeksforgeeks.org/ruby-data-types/ 'Array'
[number]: https://www.geeksforgeeks.org/ruby-data-types/ 'Number'
[string]: https://apidock.com/ruby/String 'String'