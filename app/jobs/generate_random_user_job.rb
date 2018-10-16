class GenerateRandomUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
	  # 1, orders表，所有已经结过账的前一天的单子
	  # 2，从orders表里，可以找到 dining_table_id 
	  # 3，有了order id，要extrait order_items 和 order_histories 两个表的相关内容
	  # 4，暂且不变id （如果 order ID 过大，会不会影响读码）
    user = User.new
    user.login = "user_test"
    user.password = "testtest"
    user.password_confirmation = "testtest"
    user.email = "user@test.com"
    user.save!
    sleep 2
  end
end
