class CreateSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.references :parent_sector

      t.timestamps
    end
    add_index :sectors, :name, unique: true
  end
end
