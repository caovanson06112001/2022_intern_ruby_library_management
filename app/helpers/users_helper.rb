module UsersHelper
  def render_admin
    html = ""
    html << "<div class='badge bg-success'>Admin</div>".html_safe
  end

  def render_user
    html = ""
    html << "<div class='badge bg-danger'>User</div>".html_safe
  end
end
