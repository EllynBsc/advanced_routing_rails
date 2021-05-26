class AddChefNameToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :chef_name, :string
                #table, #column_name, #datatype
  end
end
