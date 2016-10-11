class AddLowerIndexesToUsers < ActiveRecord::Migration[5.0]
  def up
    execute %{
      CREATE INDEX
        users_lower_last_name
      ON
        users (lower(last_name) varchar_pattern_ops)
    }
    execute %{
      CREATE INDEX
        users_lower_first_name
      ON
        users (lower(first_name) varchar_pattern_ops)
    }
  end
  
  def down
    remove_index :users, name: 'users_lower_last_name'
    remove_index :users, name: 'users_lower_first_name'
  end
end
