class AddSubscriptionsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :subscriptions_count, :integer, :default => 0

    Post.pluck(:id).each do |i|
      Post.reset_counters(i, :subscriptions)
    end 
  end
end
