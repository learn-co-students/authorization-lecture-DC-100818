class CreateVisitorOddities < ActiveRecord::Migration[5.2]
  def change
    create_table :visitor_oddities do |t|
      t.integer :user_id
      t.integer :oddity_id

      t.timestamps
    end
  end
end
