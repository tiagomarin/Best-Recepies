class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource_or_scope)
    public_recipes_path
  end

  # def after_sign_out_path_for(resource_or_scope)
  #   # your_path
  # end
end
