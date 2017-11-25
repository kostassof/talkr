class CreateTextTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :text_talks do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end
