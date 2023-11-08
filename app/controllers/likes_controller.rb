class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        user = User.find_by(uid: session[:login_uid])
        if user
            user.like_tweets << tweet
            redirect_to root_path
        else
            # ユーザーが見つからなかった場合のエラーハンドリング
            flash[:error] = "ユーザーが見つかりませんでした。"
            redirect_to root_path
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        user = User.find_by(uid: session[:login_uid])
        
        if user
            like = tweet.likes.find_by(user_id: user.id)
            
            if like
                like.destroy
            else
                flash[:error] = "いいねが見つかりませんでした。"
            end
        else
            flash[:error] = "ユーザーが見つかりませんでした。"
        end
        
        redirect_to root_path
    end
end
