class UpvotesController < ApplicationController
  def upvote_chirp
    chirp = Chirp.find(params[:chirp_id])
    upvote = Upvote.find_or_create_by(chirp: chirp, ip: request.remote_ip)
    upvote.save
    redirect_to controller: :chirps, action: :index
  end

  def remove_upvote
    chirp = Chirp.find(params[:chirp_id])
    upvote = Upvote.find_by(chirp: chirp, ip: request.remote_ip)
    upvote.delete
    redirect_to controller: :chirps, action: :index
  end
end
