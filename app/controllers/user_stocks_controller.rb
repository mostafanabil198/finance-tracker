class UserStocksController < ApplicationController
  def follow
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.getStockData(params[:stock_ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "You are now following #{stock.name} Stock"
    redirect_to my_portfolio_path

  end

  def destroy
    stock = Stock.find(params[:id])
    UserStock.where(user_id: current_user.id, stock_id: stock.id).first.destroy
    flash[:notice] = "You have just unfollowed #{stock.name} Stock"
    redirect_to my_portfolio_path
  end
end
