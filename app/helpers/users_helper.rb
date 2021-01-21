module UsersHelper
  def status_color(user)
    user.active? ? 'text-success' : 'text-danger'
  end
end
