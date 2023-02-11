class ChangePriceTypeInCompanies < ActiveRecord::Migration[7.0]
  def change
  change_column :companies, :price, :string
  end
end
