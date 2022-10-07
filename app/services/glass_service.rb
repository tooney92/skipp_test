class GlassService

  attr_reader :errors

  def initialize(lens, frames, user_id)
    @lens = lens
    @frame = frames
    @user_id = user_id
    @errors = []
  end

  def inventory_check
    @errors << "lens out of stock. Current stock is: #{@lens.stock}" if @lens.stock < 1
    @errors << "frame out of stock. Current stock is: #{@frame.stock}" if @frame.stock < 1
    @errors
  end

  def create_glass
    glass = Glass.create({
                   user_id: @user_id,
                   lens: @lens,
                   frame: @frame
                 })
    update_inventory
    add_to_cart(glass)
    glass
  end

  private

  def update_inventory
    @lens.decrement(:stock, 1).save
    @frame.decrement(:stock, 1).save
  end

  def add_to_cart(new_glass)
    UserCart.create({
                      glass: new_glass,
                      user_id: @user_id
                    })
  end

end
