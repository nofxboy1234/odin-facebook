class AddRefsToLike < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :post,
                  null: true,
                  foreign_key: true
    add_reference :likes, :user,
                  null: true,
                  foreign_key: true
  end
end
