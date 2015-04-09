module UserHelper
  def construct_linked_user_image_tag(user)
    link_to image_tag(user.image.url, 
              class: 'user-img'),
              user.image.remote_url, target: '_blank'
  rescue
    false
  end

  def construct_user_image_tag(user)
    image_tag(user.image.url, class: 'user-img')
  rescue
    false
  end
end