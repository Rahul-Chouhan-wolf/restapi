class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action :user_id , only: [:update , :destroy ]

    def index
        @user_data = User.find(params[:id])
        if@user_data
            render json: @user , status: :ok
        else
            render json: {msg:"Not found....."}
        end
    end

    def show_all
        @user= User.all
        if@user
            render json: @user
        else
            render json: {msg:"The database is empty."}
        end
    end

    def show
        @user=User.page params[:page]
        @check=@user.empty?
        if @check==false
            render json: @user , status: :ok
        else
            render json: {msg:"The database was only upto this point."}
        end
    end

    def create
        @user=User.create(params_user)
        if@user.save()
            render json: @user , status: :ok
        else
            render json:{msg:"user not added...."}
        end
    end

    def destroy
        if@user_data
            if@user_data.destroy(params_user)
                render json: {msg:"Deleted"} 
            else
                render json: {msg:"Not Deleted"}
            end
        else
            render json:@user_data
        end
    end
    
    def update

          if@user_data
            if@user_data.update(params_user)
                render json: {msg:"updated"} 
            else
                render json: {msg:"Not updated"}
            end
        else
            render json:{msg:"Not found...."}
        end
    end

    private
    def params_user
        params.permit(:username , :email , :password)
    end
    def user_id
        @user_data=User.find(params[:id])
    end
end