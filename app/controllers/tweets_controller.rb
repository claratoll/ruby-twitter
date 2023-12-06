class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    respond_to do |format|
      if @tweet.save
      format.html { redirect_to tweets_path, notice: 'Tweet was successfully created.' }
      else
        format.html do
          flash.now[:alert] = 'Failed to create tweet.'
          render :new
        end
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    redirect_to tweets_path
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
