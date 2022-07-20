class UsersController < ActionController::Base
    Data=["Rajat","Ankush","Shashi","Mohit","Praveen","Vikash"]
    def index
        render :json => Data
    end
    def singleUser
        render :json => Data[params[:id].to_i]
    end
end
