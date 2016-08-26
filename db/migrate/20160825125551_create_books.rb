class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :description
      t.string :text

      t.timestamps null: false
    end
  end
end
