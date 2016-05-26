class Cart < ActiveRecord::Base
belongs_to :user
has_many :line_items
has_many :items, through: :line_items

  def add_item(item)
    line_item = line_items.find_by(item_id: item) 
    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.build(item_id: item, cart_id: self.id, quantity: 1)
    end
    line_item
  end

  def total
    total = 0
    line_items.each do |item|
      total += item.total
    end
    total
  end

end
