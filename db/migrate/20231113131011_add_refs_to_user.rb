class AddRefsToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :befriender,
                  null: true,
                  foreign_key: { to_table: :users }
  end
end
