module SortableHelper

  # TODO: the controller, action thing is definitely not correct, but not sure how to get the implicit path to work with tests...
  def sortable(column, title = nil, html_options = {})
    title ||= column.titleize
    css_class = (column == sort_column) ? "sortable-current sortable-#{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:controller => controller_name, :action => action_name, :sort => column, :direction => direction}, {:class => css_class}.merge(html_options)
  end
end