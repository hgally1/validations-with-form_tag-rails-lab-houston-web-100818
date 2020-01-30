class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    if @author.errors.messages.any?
      render :new
    else
      redirect_to author_path(@author)
    end
  end

  def edit
    @author = Author.find(author_params)
  end

  def update
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
