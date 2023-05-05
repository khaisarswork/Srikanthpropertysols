class CreatePlots < ActiveRecord::Migration[7.0]
  def change
    create_table :plots do |t|
      t.integer :plot_no
      t.string :customer
      t.string :phone
      t.float :plt_amt
      t.float :advance
      t.float :agreement
      t.float :total_amt
      t.datetime :next_duedate
      t.float :first_installment
      t.float :second_installment
      t.float :third_installment
      t.float :balance_amt
      t.references :layout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
