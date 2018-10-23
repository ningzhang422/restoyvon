class OrdersCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    orders = Order.where(is_valid: true);
  end
end
