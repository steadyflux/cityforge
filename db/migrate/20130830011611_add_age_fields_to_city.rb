class AddAgeFieldsToCity < ActiveRecord::Migration
  def change
    add_column :cities, :age_description, :string
    add_column :cities, :age_modifier, :integer
  end
end
