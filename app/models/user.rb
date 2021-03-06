class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  def stock_already_added?(ticker)
    stock = Stock.find_by_ticker(ticker)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
end
