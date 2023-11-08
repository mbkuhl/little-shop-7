class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions, dependent: :destroy
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items, dependent: :destroy


  enum status: { cancelled: 0, "in progress": 1, completed: 2 }

  def self.not_complete
    where("status = 0 OR status = 1").order(created_at: :asc)
  end

  def total_revenue
    invoice_items.sum('unit_price * quantity')
  end

  def customer_name
    "#{customer.first_name} #{customer.last_name}"
  end

  def formatted_date
    created_at.strftime("%A, %B %d, %Y")
  end
end