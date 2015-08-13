class FixItemColumnName < ActiveRecord::Migration
  def self.up
    rename_column :items, :title, :name
  end
end
