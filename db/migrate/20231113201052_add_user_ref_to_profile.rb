class AddUserRefToProfile < ActiveRecord::Migration[7.1]
  def change
    add_reference :profiles, :user, null: true, foreign_key: true
  end
end
