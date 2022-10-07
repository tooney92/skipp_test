class CreateUserCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_carts do |t|
      t.references :glass, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
