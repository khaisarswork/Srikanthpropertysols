class CreateJoinTableLayoutsPlots < ActiveRecord::Migration[7.0]
  def change
    create_join_table :layouts, :plots do |t|
       t.index [:layout_id, :plot_id]
      # t.index [:plot_id, :layout_id]
    end
  end
end
