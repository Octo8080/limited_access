class UsersHomeController < ApplicationController
  before_action :authenticate_user!
  def index
    #@events = current_user.events
    #puts "#{current_user.id}:#{current_user.email}:#{current_user.events.size}"
    #@events = Event.all()
    @events = current_user.events
  end
end
