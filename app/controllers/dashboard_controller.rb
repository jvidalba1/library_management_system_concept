class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @librarian_dashboard = ::CreateLibrarianDashboard.new(Book.all).call
    @member_dashboard = CreateMemberDashboard.new(current_user).call
  end
end
