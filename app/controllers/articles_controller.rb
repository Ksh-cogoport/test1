class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        if params[:id]
            article=Article.find(params[:id])
        elsif params[:category]
            article=Article.where(category: params[:category])
        elsif params[:author]
            article=Article.where(author: params[:author])
        elsif params[:range]
            article = Article.where(published_date: params[:range].split(",")[0]..params[:range].split(",")[1])
        elsif params[:part]
            article= Article.where("title like ?","%#{params[:part]}%")
        else
            article=Article.all
        end
        render json: article
    end

    def add
        c= Article.create(title: params[:title], 
        author: params[:author],
        category: params[:category], 
        body:params[:body],
        published_date: params[:published_date])
        render json: c
    end


    def update_article
        user=Article.find(params[:id])
        user.update(author: params[:author])
        render json: user.author
    end

    def delete_article
        user=Article.find(params[:id])
        user.destroy
    end
end
