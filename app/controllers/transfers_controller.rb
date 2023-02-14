class TransfersController < ApplicationController
  def new
    transfer = Transfer.new
    @categories = Category.where(user_id: current_user.id)
    render :new, locals: { transfer:, categories: @categories }
  end

  def create
    @transfer = Transfer.new(params.require(:new_transfer).permit(:name, :amount))
    category = params.require(:new_transfer).permit(:category)
    @transfer.category = Category.find(category[:category])
    @transfer.author = current_user
    if @transfer.save
      flash[:notice] = 'Object successfully created'
      redirect_to category_path(@transfer.category.id)
    else
      flash[:alert] = 'Something went wrong'
      @categories = Category.where(user_id: current_user.id)
      render 'new', locals: { transfer:, categories: @categories }
    end
  end

  def transfer_params
    params.require(:new_transfer).permit(:name, :amount, :category)
  end
end
