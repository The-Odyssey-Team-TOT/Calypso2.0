class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.build(message_params)
    @message.user = current_user

    if @message.save
      ChatroomChannel.broadcast_to @chatroom, message: render_message(@message)
      respond_to do |format|
        format.js { render 'messages/create' } # Répondre avec un format JavaScript
        format.html { redirect_to chatroom_path(@chatroom) }
      end
    else
      respond_to do |format|
        format.js { render 'messages/fail' } # Rendre un fichier JS en cas d'échec
        format.html { render 'chatrooms/show' }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
