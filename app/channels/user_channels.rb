class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{params[:room]}"
    current_user.appear

    user = User.find params[:id]
    stream_from user
  end

  def unsubscribed
    current_user.disappear
  end

  def appear(data)
    current_user.appear(on: data['appearing_on'])
  end

  def away
    current_user.away
  end
end

