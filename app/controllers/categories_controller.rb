class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if Category.where(id: params[:id]).any?
      @category = Category.find(params[:id])
      @subsidies = @category.subsidies.order(start_date: :desc).page(params[:page]).per(Settings.service.category_pagination)
    else
      flash[:error] = 'データが存在しません'
      redirect_to categories_path
    end
  end
end
