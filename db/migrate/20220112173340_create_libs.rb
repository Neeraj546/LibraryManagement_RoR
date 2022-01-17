class CreateLibs < ActiveRecord::Migration[7.0]
  def change
    create_table :libs do |t|
      t.string :name
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
