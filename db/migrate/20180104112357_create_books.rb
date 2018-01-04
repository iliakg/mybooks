class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :length, limit: 8
      t.string :attached_file

      t.timestamps
    end
  end
end
