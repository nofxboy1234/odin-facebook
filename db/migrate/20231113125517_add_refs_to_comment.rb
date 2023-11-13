class AddRefsToComment < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :post,
                  null: true,
                  foreign_key: true
    add_reference :comments, :user,
                  null: true,
                  foreign_key: true
  end
end
