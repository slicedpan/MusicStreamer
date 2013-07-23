class RootController < ApplicationController
  def index
    
  end
  def login
    reset_session
    @u = User.authenticate(params[:username], params[:password])
    if @u.nil?      
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => { :message => "Invalid username/password" }, :status => 400 }
      end
      return
    end
    respond_to do |format|
      format.html
      format.json { render :json => {:message => "logged in", :token => @u.generate_token }, :status => 201 } 
    end
  end
  def logout
    session[:login_status] = nil
    session[:user_id] = nil
  end
end
