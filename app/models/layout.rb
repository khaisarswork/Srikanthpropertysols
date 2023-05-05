class Layout < ApplicationRecord
  has_many :plots, dependent: :delete_all
  before_create :update_layout_columns

  validates :name, presence: true
  validates :address, presence: true
  validates :total_plots, presence: true

  def layout_id
    self.id
  end
    def update_layout_columns
        self.sold = 0
        self.pending = self.total_plots
        self.amt_sold = 0
    end

    def self.update_plot_count(id, amt_sold)
        layout = Layout.find(id)
        # layout.update(sold: layout.sold + 1, pending: layout.pending - 1, amt_sold: amt_sold)
        layout.sold += 1
        layout.pending -= 1
        layout.amt_sold += amt_sold
        layout.save
    end
end
