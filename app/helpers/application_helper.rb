module ApplicationHelper
  def error_messages(errors)
    return '' if errors.empty?
    messages = errors.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
      <div class="ui icon negative message">
        <i class="close icon"></i>
        <i class="remove circle icon"></i>
        <div class="content">
          <div class="header"> Failed :( </div>
          <div class="list-wrapper">
            <ul class="ui list">#{messages}</ul>
          </div>
        </div>
      </div>
    HTML

    html.html_safe
  end
end
