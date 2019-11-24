class EntryController < ApplicationController
  before_action :set_entry, only: [:show,:limited]
  def index
    @events = Event.all()

  end

  def show

    if cookies.signed["limited_#{@event.id}"]==@event.id*10000 || (current_user && !current_user.events.find_by(id:@event.id).nil?)
      render 'show_nopass'
    else
      render 'show'
    end
  end
 
  def limited
    if cookies.signed["limited_#{@event.id}"]==@event.id*10000 || (current_user && !current_user.events.find_by(id:@event.id).nil?)
      cookies.signed["limited_#{@event.id}"]=@event.id*10000
      if(current_user)
        current_user.events<<@event
      end
      render 'limited'  
    else

      if @event.password != entry_params[:password]
        flash.now[:alert]="パスワードが異なっています"
        render 'show'
      else
        if(current_user)
          current_user.events<<@event
        end
        cookies.signed["limited_#{@event.id}"]=@event.id*10000
        render 'limited'  
      end

    end

  end
  
  private
  def set_entry
    @event = Event.find(params[:id])

  end

  def entry_params
    params.require(:event).permit(:password)
  end

end
