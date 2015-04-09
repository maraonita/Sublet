class Request < ActiveRecord::Base
 # validates :buyer_user_id, :uniqueness => {:scope => [:post_id]} # can't have the same buyer for the same post
  default_scope { order('updated_at DESC')}

  def confirmed
    Request.where(confirmed: true)
  end

  def belongs_to_user?(user)
    (user && (user.id == buyer_user_id) || (user.id == seller_user_id))
  end

  def self.unconfirmed_for_seller(user)
    Request.where(seller_user_id: user.id).where(canceled: false).where(confirmed: false)
  end

  def self.confirmed_for_seller(user)
    Request.where(confirmed: true).where(seller_user_id: user.id).where(canceled: false)
  end

  def self.unconfirmed_for_buyer(user)
    Request.where(confirmed: false).where(buyer_user_id: user.id).where(canceled: false)
  end

  def self.confirmed_for_buyer(user)
    Request.where(confirmed: true).where(buyer_user_id: user.id).where(canceled: false)
  end

  def self.open_for_this_post_and_user(post_id, user_id) # pass two IDs
    requests = Request.where(post_id: post_id, buyer_user_id: user_id, canceled: false, confirmed: false)
    return requests.length>0 ? requests.first : false
  end
end
