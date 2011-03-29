class PaymentNotificationsController < ApplicationController
  
  protect_from_forgery :except => [:create]
  
  def create
    PaymentNotification.create!(:params => params, :booking_id => params[:booking_id], :status => params[:payment_status], :transaction_id => params[:txn_id], :payment_fee => params[:payment_fee], :payment_date => params[:payment_date], :payer_email => params[:payer_email], :reference_number => params[:item_number])
    render :nothing => true
    # redirect_to home_path
  end
end
