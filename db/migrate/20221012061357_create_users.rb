class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, null: false, unique: true
      t.string :pass, null: false

      t.timestamps
    end
  end
end
