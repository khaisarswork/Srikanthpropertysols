class Plot < ApplicationRecord
  belongs_to :layout
  validates :plot_no, presence: true #, uniqueness: true
  validates :plt_amt, presence: true
  validates :advance, presence: true
  validates :agreement, presence: true

  before_save :update_plot_columns
  before_save :update_layout
  after_destroy :decrement_count

  def decrement_count
    self.layout.sold -= 1
    self.layout.pending += 1
    self.layout.amt_sold -= self.plt_amt
    self.layout.save
  end
  def update_plot_columns
    if !self.total_amt
      self.total_amt = self.plt_amt + self.agreement
    end

    if !self.next_duedate
      self.next_duedate = DateTime.now + 30
    end

    if !self.first_installment
      self.first_installment = 0
    end

    if !self.second_installment
      self.second_installment = 0
    end

    if !self.third_installment
      self.third_installment = 0
    end

    self.balance_amt = self.total_amt - self.first_installment - self.second_installment - self.third_installment - self.advance
  end

  def update_layout
   Layout.update_plot_count(self.layout.id, plt_amt)
  end
end
