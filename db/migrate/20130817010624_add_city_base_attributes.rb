class AddCityBaseAttributes < ActiveRecord::Migration
  def change
    add_column :cities, :education, :integer
    add_column :cities, :authority, :integer
    add_column :cities, :magic, :integer
    add_column :cities, :military, :integer
    add_column :cities, :tolerance, :integer
    add_column :cities, :economy, :integer

    add_column :cities, :moral, :integer
    add_column :cities, :order, :integer
  end
end
