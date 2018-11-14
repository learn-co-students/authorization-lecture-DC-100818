class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :hometown
      t.string :favorite_cryptid

      t.timestamps
    end
  end
end
