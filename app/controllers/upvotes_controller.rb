class UpvotesController < ApplicationController
  def upvote_chirp
    chirp = Chirp.find(params[:chirp_id])
    upvote = Upvote.find_or_create_by(chirp: chirp, ip: request.remote_ip)
    upvote.save
    render json: { upvote_count: chirp.upvote_count, score: chirp.score }
  end

  def remove_upvote
    chirp = Chirp.find(params[:chirp_id])
    upvote = Upvote.find_by(chirp: chirp, ip: request.remote_ip)
    upvote.delete
    chirp.reload
    render json: { upvote_count: chirp.upvote_count, score: chirp.score }
  end
end
