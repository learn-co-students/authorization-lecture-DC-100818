class CreateOddities < ActiveRecord::Migration[5.2]
  def change
    create_table :oddities do |t|
      t.string :name
      t.text :description
      t.text :actual_description
      t.integer :museum_id

      t.timestamps
    end
  end
end
