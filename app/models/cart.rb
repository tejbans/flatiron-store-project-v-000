class Cart < ActiveRecord::Base
  
  has_many :line_items, dependent: :destroy
  has_many  :items, through: :line_items
  belongs_to  :user
  

 def total
  total = 0
  line_items.each do |line_item|
    total += line_item.item.price * line_item.quantity
  end
  total
 end

 def add_item(itemid)
      if item_ids.include?(itemid)
         li = line_items.find_by(item_id: itemid)
          li.quantity +=1
          li
      else
          line_items.build(item_id: itemid)
      end
 end

 def checkout
  remove_inventory
  update(status: 'submitted')
  
  end

 private

 def remove_inventory
   line_items.each do |line_item|
     line_item.item.remove(line_item.quantity)
   end
 end


end
