class Table
  attr_reader :size, :val_pos
  def initialize(size)
    @size = size < 3 ? 3 : size

    @table = ""
    reset_val_pos
  end

  def display
    render_table
    puts @table
    self
  end

  def update_table(opts = {})
    loc = location(opts[:coordinate])
    @val_pos[loc] = opts[:mark]
    display
    true
  end

  def check_grid(coor)
    coordinate = location(coor)

    if !location_exist?(coordinate)
      puts "The Grid is not exists, please choose others"
      return true
    elsif location_filled?(coordinate)
      puts "The Grid already filled, please choose others"
      return true
    end
    false
  end

  def location(opts = {})
    if opts[:x].to_i > @size || opts[:y].to_i > @size
      0
    else
      row(opts[:x]) + opts[:y].to_i
    end
  end

  def location_exist?(loc)
    @val_pos.has_key?(loc)
  end

  def total_grids
    @size ** 2
  end

  def location_filled?(loc)
    @val_pos[loc] != " "
  end

  def coordinate(loc)
    y = if loc % @size == 0
      1
    else
      loc % @size
    end
    { x: loc/@size, y: y }
  end

private

  def solution
    
  end

  def render_table
    @table = ""
    @table << create_border << create_content << create_border
  end

  def row(x)
    (x.to_i - 1) * @size
  end

  def reset_val_pos
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