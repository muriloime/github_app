class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :handle
      t.jsonb :json

      t.timestamps
    end
  end
end
