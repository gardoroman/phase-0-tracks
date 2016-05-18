class TodoList
  
  def initialize(item_array)
    @items = item_array
  end


  def get_items
    @items
  end

  def add_item(item_string)
    @items << item_string
  end

  def delete_item(item_name)
    @items.delete(item_name)
  end

  def get_item(item_index)
    @items[item_index]
  end
  
end