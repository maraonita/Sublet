class UserMailer < ActionMailer::Base
  default from: ENV["GMAIL_USERNAME"] 

	def sublet_info_email(subletter, post)
		@user = subletter 
		@sublet_owner = post.user
		@sublet = post
		mail(to: @user.email, subject: 'Sublet Succesfully Booked! Basic Information')
	end

	def sublet_booked_admin_email(subletter, post)
		@user = subletter 
		@sublet = post
		mail(to: ENV["GMAIL_USERNAME"], subject: 'Someone Booked a Sublet!')
	end

	def sublet_booked_owner_email(subletter, post)
		@user = subletter 
		@sublet = post
		mail(to: @sublet.user.email, subject: 'Someone Booked Your Sublet')
	end
end
