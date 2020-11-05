class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name,   null: false, default: ""
      t.string :author, null: false, default: ""
      t.timestamps
    end
  end
end
