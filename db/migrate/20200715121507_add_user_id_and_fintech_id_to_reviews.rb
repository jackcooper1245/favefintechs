class AddUserIdAndFintechIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :fintech_id, :integer
  end
end
