class LocalesController < ApplicationController

  def update
    set_locale params[:locale]
    redirect_back_or_to root_path
  end

end
