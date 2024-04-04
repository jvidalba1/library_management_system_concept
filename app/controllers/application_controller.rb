class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  devise_group :user, contains: [:librarian, :member]
  before_action :set_render_borrowing

  def set_render_borrowing
    @render_borrowing = true
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
