class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :gender, limit: 1
      t.integer :height_in_cm
      t.integer :weight_in_kg
      t.string :phone

      t.references :user

      t.timestamps
    end
  end
end
