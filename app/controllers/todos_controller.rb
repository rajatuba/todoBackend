class TodosController < ActionController::Base
    def index 
        limit = params[:limit]
        puts limit
        data=["Learn Ruby","Learn Ruby on rails","Learn Sql Database","Learn Web3","Learn soket.io"]
        render :json => 
            if limit 
                data.slice(0,limit.to_i)
            else
                data
            end
    end
    skip_before_action :verify_authenticity_token
    def test 
        image_path = params[:image]
        content_length = request.content_length
        my_read = request.body.read(content_length)
        my_base64 = Base64.decode64(my_read)
    end

    def todoAll
        todoList=Todo.all
        render :json=>todoList
    end
    def add
        puts "params"
        puts params
        todoItem={
            "title"=>params[:title]
        }
        puts todoItem
        todo=Todo.new(todoItem)
        todo.save
        render :json=>todo
    end
    def update
        todo=Todo.find(params[:id])
        puts "update"
        puts params[:id]
        todo.update(title:params[:title])
        render :json => "Successfully updated"
    end
    def delete
        puts "delete"
        puts params[:id]
        todoItem=Todo.find(params[:id].to_i)
        todoItem.destroy
        render :json => "Deleted Successfully"
    end
    def statusUpdate
        puts "inside status update"
        todoItem=Todo.find(params[:id].to_i)
        prev=todoItem[:status]
        puts "prev value"
        puts prev
        todoItem.update(status:!prev)
        render :json => todoItem
    end
end
