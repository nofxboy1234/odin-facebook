class AddAutorRefToPost < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :author, null: true, foreign_key: { to_table: :users }
  end
end
