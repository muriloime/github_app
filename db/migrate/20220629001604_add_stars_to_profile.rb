class AddStarsToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :stars, :integer
  end
end
