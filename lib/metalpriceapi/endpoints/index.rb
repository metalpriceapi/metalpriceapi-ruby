# # frozen_string_literal: true

module MetalpriceAPI
  module Endpoints
    def fetchSymbols
      get('symbols')
    end

    def fetchLive(base = nil, currencies = nil)
      options = removeEmpty({
        base: base,
        currencies: (currencies || []).join(',')
      })
      get('latest', options)
    end

    def fetchHistorical(date, base = nil, currencies = nil)
      options = removeEmpty({
        base: base,
        currencies: (currencies || []).join(',')
      })
      get(date, options)
    end

    def fetchOHLC(base = nil, currency = nil, date = nil, unit = nil, dateType = nil)
      options = removeEmpty({
        base: base,
        currency: currency,
        date: date,
        unit: unit,
        dateType: dateType
      })
      get('ohlc', options)
    end

    def convert(from_currency = nil, to_currency = nil, amount = nil, date = nil)
      options = removeEmpty({
          'from': from_currency,
          'to': to_currency,
          'amount': amount,
          'date': date
      })
      get('convert', options)
    end

    def timeframe(start_date, end_date, base = nil, currencies = nil)
      options = removeEmpty({
          'start_date': start_date,
          'end_date': end_date,
          'base': base,
          'currencies': (currencies || []).join(',')
      })
      get('timeframe', options)
    end

    def change(start_date, end_date, base = '', currencies = nil)
      options = removeEmpty({
          'start_date': start_date,
          'end_date': end_date,
          'base': base,
          'currencies': (currencies || []).join(',')
      })
      get('change', options)
    end

    def carat(base = '', date = nil)
      options = removeEmpty({
          'base': base,
          'date': date
      })
      get('carat', options)
    end

    def usage
      get('usage')
    end

    private

    def removeEmpty(options)
      options.each do |key, value|
        if (!value || value == '')
          options.delete(key)
        end
      end
      options
    end
  end
end
