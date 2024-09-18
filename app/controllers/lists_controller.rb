class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      Rails.logger.debug @list.errors.full_messages.to_s
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id]) # Find the list before attempting to destroy it
    @list.destroy # This will now also destroy associated bookmarks

  redirect_to lists_url, notice: 'List was successfully deleted.'
  end

  private

  def list_params
    params.require(:list).permit(:name, :photos)
  end
end
