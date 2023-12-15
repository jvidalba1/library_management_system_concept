class ApplicationController < ActionController::Base
  devise_group :user, contains: [:librarian, :member]
  before_action :set_render_borrowing

  def set_render_borrowing
    @render_borrowing = true
  end
end
