class CreateTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :length
      t.string :address
    end
  end
end
