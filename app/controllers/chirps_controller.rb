require 'HTTParty'

class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all.reverse
  end

  def new
    @chirp = Chirp.new
  end

  def create
    chirp = Chirp.new(chirp_params)

    if chirp.save
      push_notification(chirp)
      redirect_to action: :index
    else
      flash[:errors] = chirp.errors.full_messages
      redirect_to :new
    end
  end

  private

  API_ENDPOINT = 'https://bellbird.joinhandshake-internal.com/push'

  def push_notification(chirp)
    Thread.new do
      response = HTTParty.post(
        API_ENDPOINT,
        body: {
          chirp_id: chirp.id
        }
      )

      puts '+++ Logging push response +++'
      p response
      puts '--- push response ends ---'
    end
  end

  def chirp_params
    params.require(:chirp).permit(:message)
  end
end
