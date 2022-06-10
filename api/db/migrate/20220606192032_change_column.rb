class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :name, :string, :null => false
    change_column :ingredients, :name, :string, :null => false
  end
end
