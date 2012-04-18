class PagesController < ApplicationController
   def login
      logging = false
      if params[:username] == nil
         username = password = ""
      else
         username = params[:username]
         password = params[:password]
         logging = true
      end
      conn = ActiveRecord::Base.connection
      user_id = conn.select_value("select getID('" + username + "','" + password + "')").to_i
      if logging == true
         cookies.signed[:uid] = user_id
         redirect_to :controller => "pages", :action => "admin" 
      end
   end
   def admin
      @id = cookies.signed[:uid]
      respond_to do |format| 
         format.html {render :text => @id}
      end
   end
end
