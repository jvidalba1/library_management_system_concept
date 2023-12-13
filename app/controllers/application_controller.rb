class ApplicationController < ActionController::Base
  devise_group :user, contains: [:librarian, :member]

end
