class AddUrlAndFoundersColumnToFinteches < ActiveRecord::Migration
  def change
    add_column :finteches, :url, :string
    add_column :finteches, :founders, :string
  end
end
