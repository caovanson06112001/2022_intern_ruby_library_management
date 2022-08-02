module UsersHelper
  def render_admin
    html = []
    html << content_tag(:div, t("admin"), class: "badge bg-success")
    safe_join(html)
  end

  def render_user
    html = []
    html << content_tag(:div, t("user"), class: "badge bg-danger")
    safe_join(html)
  end
end
