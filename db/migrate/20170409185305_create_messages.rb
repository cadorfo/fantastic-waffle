class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :content_type
      t.text :translated_content
      t.references :user, foreign_key: true
      t.string :timestamps

      t.timestamps
    end
  end
end
