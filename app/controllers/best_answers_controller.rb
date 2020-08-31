class BestAnswersController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to root_path
  end

  def create

  end

  def destroy
    
  end
end
