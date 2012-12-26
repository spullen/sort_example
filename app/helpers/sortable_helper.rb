module SortableHelper
  def sortable(column, title = nil, html_options = {})
    title ||= column.titleize
    css_class = (column == sort_column) ? "sortable-current sortable-#{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}.merge(html_options)
  end
end