class AddLowerIndexesToLocations < ActiveRecord::Migration[5.0]
  def up
    execute %{
      CREATE INDEX
        locations_lower_city
      ON
        locations (lower(city) varchar_pattern_ops)
    }
    execute %{
      CREATE INDEX
        locations_lower_state
      ON
        locations (lower(state) varchar_pattern_ops)
    }
  end
  
  def down
    remove_index :locations, name: 'locations_lower_city'
    remove_index :locations, name: 'locations_lower_state'
  end
end
