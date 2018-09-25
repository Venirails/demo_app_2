class AdminController < ApplicationController
  #before_filter :session_expiry,:except=>:login,:logout
  #before_filter :update_activity_time,:except=>:login,:logout

  def login
	if request.post?
		  if params[:admin][:admin_name] == "admin" && params[:admin][:password] == "nimda"
			  session[:admin] = "admin_id"
			  redirect_to :controller=>"books"
		 else
			 flash[:notice] = "Invalid Username/Password"
			 render :action=>"login"
		 end
	end
end

def logout
	session[:admin]=nil
	flash[:notice]="You are logged out"
	redirect_to :action=>"login"
	
end
end
