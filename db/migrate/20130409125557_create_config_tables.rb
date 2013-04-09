class CreateConfigTables < ActiveRecord::Migration
  def change
    create_table :config_tables do |t|
      t.decimal :hra_percent
      t.decimal :basic_percent
      t.decimal :conveyance
      t.decimal :professional_tax
      t.decimal :edu_cess

      t.timestamps
    end
  end
end
