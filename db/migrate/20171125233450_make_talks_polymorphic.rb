class MakeTalksPolymorphic < ActiveRecord::Migration[5.0]
  class Talk < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextTalk < ApplicationRecord; end

  def change
    change_table(:talks) do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_type, :content_id]
    end

    reversible do |dir|
      Talk.reset_column_information
      Talk.find_each do |talk|
        dir.up do
          text_talk = TextTalk.create(body: talk.body)
          talk.update(content_id: text_talk.id, content_type: "TextTalk")
        end
        dir.down do
          talk.update(body: talk.content.body)
          talk.content.destroy
        end
      end
    end

    remove_column :talks, :body, :string
  end
end
