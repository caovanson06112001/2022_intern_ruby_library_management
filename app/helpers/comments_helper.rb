module CommentsHelper
  def render_comment comment, time
    "<div class='row time time-#{time}' data-id='#{comment.id}'
      data-parent='#{comment.parent_id}'>
      <div class='col-xl-1 col-xxl-1 comment_user'>
        #{image_tag('user/avatar.png', alt: '', class: 'img-radius w-100')}
      </div>
      <div class='col-xl-7 col-xxl-7'>
        <div>#{comment.content} - <span>
        #{time_ago_in_words comment.created_at} trước</span></div>
        <div>#{comment.user_name} -
          #{link_to(t('comments.answer'), 'javascript:void(0)',
                    {class: 'answer', data: {id: comment.id, bs_toggle:
                    'modal', bs_target: '#exampleModalCenter'}})}
        </div>
      </div>
    </div>"
  end

  def render_comment_not_end comment, time
    "<div class='row time time-#{time}' data-id='#{comment.id}'
      data-parent='#{comment.parent_id}'>
      <div class='col-xl-1 col-xxl-1 comment_user'>
        #{image_tag('user/avatar.png', alt: '', class: 'img-radius w-100')}
      </div>
      <div class='col-xl-7 col-xxl-7'>
        <div>#{comment.content} - <span>
        #{time_ago_in_words comment.created_at} trước</span></div>
        <div>#{comment.user_name} -
          #{link_to(t('comments.answer'), 'javascript:void(0)',
                    {class: 'answer', data: {id: comment.id, bs_toggle:
                    'modal', bs_target: '#exampleModalCenter'}})}
      </div>
    </div>"
  end

  def show_comments comments, parent_id = 0, time = "", html = ""
    comments.each do |comment|
      next unless comment.parent_id == parent_id

      html << if comment.parent_id != 0
                render_comment comment, time
              else
                render_comment_not_end comment, time
              end
      show_comments comments.reverse, comment.id, "#{time}-", html
      html << "</div><hr>" if comment.parent_id.zero?
    end
    html
  end
end
