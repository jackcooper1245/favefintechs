class CreateFintechs < ActiveRecord::Migration
  def change
    create_table :finteches do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
