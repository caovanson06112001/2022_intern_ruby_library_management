class Users::SessionsController < Devise::SessionsController
  def destroy
    session.delete("warden.user.user.key")
    redirect_to root_path
  end
end
