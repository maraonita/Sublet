module PostsHelper
  def construct_linked_post_image_tag(post)
    link_to image_tag(post.image.url, 
              class: 'post-img'),
              post.image.remote_url, target: '_blank'
  rescue
    false
  end

  def construct_post_image_tag(post)
    image_tag(post.photos.first.image.url, class: 'post-img')
  rescue
    false
  end

	def format_type_and_neighborhood(post)
		"#{post.housing_type_name} in #{post.neighborhood_name}"
	end
end
