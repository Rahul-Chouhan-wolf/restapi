class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action :book_id , only: [:update , :delete]

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
    def update
        if@book_id
          if @book_id.update(Title: params[:Title],desc: params[:desc],price: params[:price])
            render json: @book_id , status: :ok
            else
                render json: {msg:"Update Failed...."}
            end
        else
            render json: {msg:"Not Found..."}
        end
    end

    #---------------Delete
    def delete
        if @book_id
           if  @book_id.destroy(Title: params[:Title],desc: params[:desc],price: params[:price])

            render json: {message: "Deleted"} , status: :ok
           else
            render json: {message: "Failed"}
           end
        else
            render json: {msg:"Not Found..."}
        end
    end



    private
    def params_new
        params.permit(:Title , :desc , :price)
    end
    def book_id
        @book_id=Book.find(params[:id])
    end
end