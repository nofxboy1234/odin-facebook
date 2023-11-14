class AddPostRefToLike < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :post,
                  null: true,
                  foreign_key: true
  end
end
