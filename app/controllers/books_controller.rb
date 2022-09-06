class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    #-------------------Create
    def create
        @book = Book.create(params_new)

        if @book.save()
            render json: @book , status: :ok
        else
            render json: {message:"Not added"}
        end
    end
    
    #--------------------show
    def show
        @book = Book.all
        
        if @book
            render json: @book , status: :ok

        else
            render json: {message: "Empty...."} , status: :null_store
        end
    end
    #-----------------Update

    #---------------Delete
    def delete
        if @del
           if  @del.Destroy()
            render json: {message: "Deleted"} , status: :ok
           else
            render json: {message: "Failed"}
           end
        else
            render json: {message: "Not found"}
        end

    end

    private
        def del_id
           @del=Book.find(params[:id])
        end

    private
    def params_new
        params.permit(:Title , :desc , :price)
    end
end