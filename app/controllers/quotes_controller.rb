class QuotesController < ApplicationController
  respond_to :html
  
  sortable "price"
  
  def index
    @quotes = Quote.sort(sort_column, sort_direction)
    respond_with(@quotes)
  end
  
end