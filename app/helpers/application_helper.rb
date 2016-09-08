module ApplicationHelper
  def full_title page_title = ""
    base_title = t "footer.page_name"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def sortable column, title = nil
    title ||= column.titleize
    direction = if column == params[:sort] && params[:direction] == "asc"
      "desc"
    else
      "asc"
    end
    link_to title, {sort: column, direction: direction}
  end
end
