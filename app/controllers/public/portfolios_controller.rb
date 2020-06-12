class Public::PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def create
    @portfolio = current_user.portfolios.new(portfolio_params)
    if @portfolio.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to user_path(current_user)
  end

  private
    def portfolio_params
      params.require(:portfolio).permit(:title, :description, :link)                          
    end
end
