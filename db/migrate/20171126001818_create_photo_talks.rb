class CreatePhotoTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_talks do |t|
      t.attachment :image, null: false

      t.timestamps
    end
  end
end
