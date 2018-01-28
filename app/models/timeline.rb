class Timeline
  include ActiveModel::Conversion

  def initialize(users, scope = Talk)
    @users = users
    @scope = scope
  end

  def talks
    scope.
      where(user_id: users).
      order(created_at: :desc)
  end

  private

  attr_reader :users, :scope
end
