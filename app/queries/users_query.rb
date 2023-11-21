module UsersQuery
  extend self

  def friends(user_id:)
    query = relation.joins(sql).where.not(id: user_id)

    final_query = query.where(friendships: { user_id: })
         .or(query.where(friendships: { friend_id: user_id }))
    debugger
  end

  private

  def relation
    @relation ||= User.all
  end

  def sql(scope: false)
    <<~SQL
      INNER JOIN friendships
        ON users.id = friendships.friend_id
        OR users.id = friendships.user_id
    SQL
  end
end
