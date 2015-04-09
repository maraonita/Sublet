module PostsHelper
  def construct_linked_post_image_tag(post)
    link_to image_tag(post.image.url, 
              class: 'post-img'),
              post.image.remote_url, target: '_blank'
  rescue
    false
  end

  def construct_post_image_tag(post)
    image_tag(post.image.url, class: 'post-img')
  rescue
    false
  end
end
