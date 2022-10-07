class CreateGlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :glasses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :frame, null: false, foreign_key: true
      t.references :lens, null: false, foreign_key: true
      t.decimal :lens_amount, precision: 5, scale: 2, null: false
      t.decimal :frames_amount, precision: 5, scale: 2, null: false

      t.timestamps
    end
  end
end
