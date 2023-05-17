class AddPriceToTrainingSession < ActiveRecord::Migration[7.0]
  def change
    add_column :training_sessions, :price, :integer, null: false, default: 0
  end
end
