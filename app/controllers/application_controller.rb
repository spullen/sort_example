class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  #def sort_direction
  #  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  #end
  #helper_method :sort_direction
  
  # need to make this more generic
  #def sort_column
  #  params[:sort].blank? ? "price" : params[:sort]
  #end
  #helper_method :sort_column
end
