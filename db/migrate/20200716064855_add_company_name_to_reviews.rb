class AddCompanyNameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :company_name, :string
  end
end
