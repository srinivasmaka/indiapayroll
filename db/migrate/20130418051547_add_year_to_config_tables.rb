class AddYearToConfigTables < ActiveRecord::Migration
  def change
    add_column :config_tables, :year, :string
  end
end
