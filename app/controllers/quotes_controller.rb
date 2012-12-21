class QuotesController < ApplicationController
  respond_to :html
  
  def index
    puts "HERE #{sort_column} - #{sort_direction}"
    @quotes = Quote.sort(sort_column, sort_direction)
    respond_with(@quotes)
  end
  
  private
  
  # need to think of a way to make this generic, probably some method definition similar to the likes of has_scope
  def sort_column
    params[:sort].blank? ? "price" : params[:sort]
  end
  helper_method :sort_column
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  helper_method :sort_direction
end