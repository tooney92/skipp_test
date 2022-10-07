class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :status, null: false
      t.integer :stock, null: false
      t.decimal :price, precision: 5, scale: 2, null: false

      t.timestamps
    end

    add_check_constraint :frames, "price > 0",
                         name: "price_non_negative_or_zero"
  end
end
