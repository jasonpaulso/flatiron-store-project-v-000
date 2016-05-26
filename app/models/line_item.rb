class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def title
    Item.find(item_id).title
  end
  def sold
    self.item.inventory -= self.quantity
    self.item.save
  end

  def total
    self.quantity * self.item.price
  end
end
