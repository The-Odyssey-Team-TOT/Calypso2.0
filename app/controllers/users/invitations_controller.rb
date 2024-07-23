class Users::InvitationsController < Devise::InvitationsController
  # before_action :configure_permitted_parameters
  # before_action :set_chatroom, only: :create

  # def after_accept_path_for(resource)
  #   stored_location_for(resource) || chatroom_path(@chatroom)
  # end

  # def invite
  #   @invite = Invite.new
  #   @chatroom
  # end

  # def send_invite
  #   user_id = params[:user_id]
  #   chatroom_id = params[:chatroom_id]
  #   email = params[:email]
  #   if user_id.present? && chatroom_id.present? && email.present?
  #     @user = User.find(params[:user_id])
  #     @chatroom = Chatroom.find(params[:chatroom_id])
  #     if @user && @chatroom
  #       @user.invite!(email: email)
  #       @user.push(@chatroom)
  #     end
  #   end
  # end

  # private

  # def set_chatroom
  #   @chatroom = Chatroom.find_by(params[:chatroom_id])
  # end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:invite, keys: [:nickname, :description, :spoken_language, :learning_language])
  # end
end
