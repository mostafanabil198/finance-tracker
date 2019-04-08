class Stock < ApplicationRecord

  def self.getStockData(ticker_symbol)
    begin
      stockData = StockQuote::Stock.quote(ticker_symbol)
      new(name: stockData.company_name, ticker: stockData.symbol, last_price: stockData.latest_price)
    rescue Exception => e
      return nil
    end
  end


end
