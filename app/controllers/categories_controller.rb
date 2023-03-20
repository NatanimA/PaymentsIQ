class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.where(user_id: current_user.id)
    @name = 'Categories'
  end

  def new
    category = Category.new
    render :new, locals: { category: }
  end

  def create
    @category = Category.new(params.require(:new_category).permit(:name, :icon))
    @category.user = current_user
    if @category.save
      flash[:notice] = 'Category successfully created'
      redirect_to categories_path
    else
      flash[:alert] = @category.errors.full_messages.join(', ')
      render 'new', locals: { category: @category }
    end
  end

  def show
    @transfers = Transfer.where(author_id: current_user.id, category_id: params[:id]).order(:created_at).reverse_order
    @name = 'TRANSFERS'
    @category_id = params[:id]
    @category = Category.find(@category_id)
  end
end
