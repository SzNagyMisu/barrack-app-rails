class CreateTrainingSessionUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :training_session_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :training_session, null: false, foreign_key: true
      t.integer :state, limit: 1

      t.timestamps
    end
  end
end
