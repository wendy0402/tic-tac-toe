class Table
  def initialize(size)
    @size = size < 3 ? 3 : size

    @table = ""
    reset_pos_val
    @table << create_border << create_content << create_border
  end

  def display
    puts @table
    self
  end

  def update_table(opts = {})
    opts[:location].x
  end

private
  def reset_pos_val
    @val_pos ||= {}
    (@size ** 2).times do |n|
      @val_pos[n+1] = " "
    end
  end

  def create_border
    "-" * ((@size * 2) + 1)
  end

  def create_content
    content = ""
    row = 0
    @val_pos.each do |key, value|
      if key % @size == 1
        row += 1
        content << add_new_line(content, key)
      end
      content << "|#{value}"
    end
    content << "|\n"
  end

  def add_new_line(content, key)
    key != 1 ? "|\n" : "\n"
  end
end