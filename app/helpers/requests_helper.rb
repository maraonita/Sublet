module RequestsHelper
  def url_for_requested_post(request)
    url_for post_path(Post.find(request.post_id))
  rescue
    false
  end
end
