class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username] == "admin" && params[:password] == "password"
        session[:admin] = params[:username]
        flash[:notice] = "Welcome, admin"
        redirect_to :controller => "books", :action => "index"
      else 
        flash[:notice] = "Invalid username or password"
        render :action => :login                            # you can write string here too
        
      end
    end
  end

  def logout
    session[:admin] = nil
    flash[:notice] = "You are now Logged out!!!"
    redirect_to :action => "login"
  end
end
