class AddTimestampsToFintechs < ActiveRecord::Migration
  def change
    add_column :finteches, :created_at, :datetime
    add_column :finteches, :updated_at, :datetime
  end
end
