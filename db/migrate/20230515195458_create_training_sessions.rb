class CreateTrainingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :training_sessions do |t|
      t.string :code
      t.datetime :start_time
      t.references :trainer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
