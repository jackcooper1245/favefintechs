class AddDataColumnsToFintechs < ActiveRecord::Migration
  def change
    add_column :finteches, :founded, :string
    add_column :finteches, :sector, :string
  end
end
