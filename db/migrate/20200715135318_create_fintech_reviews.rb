class CreateFintechReviews < ActiveRecord::Migration
  def change
    create_table :fintech_reviews do |t|
      t.integer :user_id
      t.integer :fintech_id
    end
  end
end
