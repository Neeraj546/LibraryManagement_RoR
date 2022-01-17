class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_at
      t.string :language
      t.integer :lib_id
      t.integer :author_id

      t.timestamps
    end
  end
end
