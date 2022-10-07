class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses do |t|
      t.string :color, null: false
      t.text :description, null: false
      t.integer :prescription_type, null: false
      t.integer :stock, null: false
      t.decimal :price, precision: 5, scale: 2, null: false
      t.integer :lens_type, null: false

      t.timestamps
    end

    add_check_constraint :lenses, "price > 0",
                         name: "price_non_negative_or_zero"
  end
end
