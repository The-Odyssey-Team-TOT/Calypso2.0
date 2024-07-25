class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.build(message_params)
    @message.user = current_user
    @notification = Notification.new(message_id: @message.id)

    if @message.save
      ChatroomChannel.broadcast_to @chatroom, message: render_message(@message)
      # @chatroom.users.where.not(id: current_user.id).each do |user|
        @notification = Notification.create(
          user: current_user,
          recipient: current_user,
          notifiable: @message,
          action: "sent",
          message: @message
        )
        NotificationsChannel.broadcast_to(current_user,  render_to_string(partial: "notifications/notification", locals: {notification: @notification}))
        head :ok
      # end
      # respond_to do |format|
      #   format.js { render 'messages/create' }
      #   format.html { redirect_to chatroom_path(@chatroom) }
      # end
    else
      # respond_to do |format|
      #   format.js { render 'messages/fail' }
      #   format.html { render 'chatrooms/show' }
      render "chatrooms/show", status: :unprocessable_entity
      # end
    end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end

  def render_notification(notification)
    ApplicationController.render(partial: 'notifications/notification', locals: { notification: notification })
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
