class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :ticker
      t.string :name
      t.float :price
      t.float :market_cap
      t.integer :IPO_year
      t.string :sector

      t.timestamps
    end
  end
end
