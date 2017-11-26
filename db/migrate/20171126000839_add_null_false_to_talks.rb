class AddNullFalseToTalks < ActiveRecord::Migration[5.0]
  def change
    change_column_null :talks, :user_id, false
    change_column_null :talks, :content_id, false
    change_column_null :talks, :content_type, false
  end
end
