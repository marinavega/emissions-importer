class CreateEmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :emissions do |t|
      t.jsonb :data

      t.timestamps
    end
    add_reference :emissions, :country, null: false, foreign_key: true
    add_reference :emissions, :sector, null: false, foreign_key: true
    add_index :emissions, :data, using: :gin
    add_index :emissions, "(data->'year')", name: "index_year_on_data_emissions"
    add_index :emissions, %i[country_id sector_id], unique: true
  end
end
