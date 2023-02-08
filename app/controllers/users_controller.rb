class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        user=User.all
        render json: user
    end

    def add
        new_user= User.create(email: params[:email], 
        password: params[:password], 
        name: params[:name], 
        phone: params[:phone])
        render json: new_user
    end

    def check
        user=User.where(email: params[:email])
        if user != []
            if user[0].authenticate(params[:user][:password])
                render html:"correct"
            else
                render html:"incorrect"
            end
        else
            render html:"not found"
        end
    end
    
    def update_user
        user=User.where(email: params[:email])
        if user != []
            if user[0].authenticate(params[:user][:password])
                user[0].update(password: params[:new_password])
                render html:"updated"
            else
                render html:"incorrect password"
            end
        else
            render html:"not found"
        end
    end

    def delete_user
        user=User.find(params[:id])
        user.destroy
    end
end
