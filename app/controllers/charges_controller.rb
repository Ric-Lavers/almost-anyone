class ChargesController < ApplicationController

  def index
    @plans = [["Basic", 20], ["Silver", 60], ["Pro", 100]]
  end

  def new

  end

  def create
    # Amount in cents
    puts "*"*20
    puts "#{params[:format]}".red
    puts "*"*20
    @amount = params[:format].to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount*100,
      :description => 'Rails Stripe customer',
      :currency    => 'aud'
    )
    redirect_to tours_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    puts "ERROR PATH "*10
    redirect_to tours_path
  end

end
