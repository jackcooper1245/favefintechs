class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.timestamp :created_at
      t.integer :rating
    end
  end
end
