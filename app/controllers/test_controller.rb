class TestController < ActionController::Base
    def index
        render :json=> ["rajat","trest"]
    end
end
