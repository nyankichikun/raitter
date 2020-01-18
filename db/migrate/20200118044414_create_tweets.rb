class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
