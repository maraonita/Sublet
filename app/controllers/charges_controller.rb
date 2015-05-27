class ChargesController < ApplicationController

	def new
	end

	def create
		@payment = Payment.find(params[:payment_id])
		@amount = (params[:amount].to_i * 100).to_s #must be in cents for stripe
		@description = "Billing for #{params[:date]}"
		
		charge = Stripe::Charge.create(
			:customer => params[:customer_id],
			:amount => @amount,
			:description => 'Rails Stripe Customer',
			:currency => 'usd'
		)
		@payment.update_attributes(paid: true)
		flash[:success] = "Card succesfully charged"	
		redirect_to payments_path
		
		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to payments_path 
	end
end
