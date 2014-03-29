class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource param_method: :category_params

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Saved"
      redirect_to admin_category_url @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = "Updated"
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:success] = "Deleted"
    redirect_to admin_categories_url
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end