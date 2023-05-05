class CreateLayouts < ActiveRecord::Migration[7.0]
  def change
    create_table :layouts do |t|
      t.string :name
      t.string :address
      t.integer :total_plots
      t.integer :sold
      t.integer :pending
      t.float :amt_sold

      t.timestamps
    end
  end
end
