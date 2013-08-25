class AddSizeToCities < ActiveRecord::Migration
  def change
    add_column :cities, :size, :string
    add_column :cities, :population_estimate, :integer
    add_column :cities, :size_modifier, :integer
    add_column :cities, :min_density, :integer
    add_column :cities, :max_density, :integer
  end
end
