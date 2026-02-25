# # frozen_string_literal: true

module MetalpriceAPI
  module Endpoints
    def fetchSymbols
      get('symbols')
    end

    def fetchLive(base = nil, currencies = nil, unit = nil, purity = nil, math = nil)
      options = removeEmpty({
        base: base,
        currencies: (currencies || []).join(','),
        unit: unit,
        purity: purity,
        math: math,
      })
      get('latest', options)
    end

    def fetchHistorical(date, base = nil, currencies = nil, unit = nil)
      options = removeEmpty({
        base: base,
        currencies: (currencies || []).join(','),
        unit: unit,
      })
      get(date, options)
    end

    def hourly(base = nil, currency = nil, unit = nil, start_date = nil, end_date = nil, math = nil, date_type = nil)
      options = removeEmpty({
        base: base,
        currency: currency,
        unit: unit,
        start_date: start_date,
        end_date: end_date,
        math: math,
        date_type: date_type,
      })
      get('hourly', options)
    end

    def fetchOHLC(base = nil, currency = nil, date = nil, unit = nil, date_type = nil)
      options = removeEmpty({
        base: base,
        currency: currency,
        date: date,
        unit: unit,
        date_type: date_type,
      })
      get('ohlc', options)
    end

    def convert(from_currency = nil, to_currency = nil, amount = nil, date = nil, unit = nil)
      options = removeEmpty({
          'from': from_currency,
          'to': to_currency,
          'amount': amount,
          'date': date,
          'unit': unit,
      })
      get('convert', options)
    end

    def timeframe(start_date, end_date, base = nil, currencies = nil, unit = nil)
      options = removeEmpty({
          'start_date': start_date,
          'end_date': end_date,
          'base': base,
          'currencies': (currencies || []).join(','),
          'unit': unit,
      })
      get('timeframe', options)
    end

    def change(start_date, end_date, base = nil, currencies = nil, date_type = nil)
      options = removeEmpty({
          'start_date': start_date,
          'end_date': end_date,
          'base': base,
          'currencies': (currencies || []).join(','),
          'date_type': date_type,
      })
      get('change', options)
    end

    def carat(base = nil, currency = nil, date = nil)
      options = removeEmpty({
          'base': base,
          'currency': currency,
          'date': date,
      })
      get('carat', options)
    end

    def usage
      get('usage')
    end

    private

    def removeEmpty(options)
      options.each do |key, value|
        if (value.nil? || value == '')
          options.delete(key)
        end
      end
      options
    end
  end
end
