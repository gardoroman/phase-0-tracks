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
  
end