class ChangePriceColumnItems < ActiveRecord::Migration
  def change
    change_column :items, :price, :decimal
  end
end
