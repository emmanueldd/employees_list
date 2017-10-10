class Api::ProsController < ApiController
  def index
    @pros = Pro.all
  end
end

Booking.where(charged: true, user: nil).each do |booking|
  booking.update(user: booking.order.user)
end

Booking.where(charged: true, pro: nil).each do |booking|
  booking.update(pro: booking.order.pro)
end
