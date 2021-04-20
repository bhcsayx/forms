class AdminController < ApplicationController

def index
	@resps = Response.find_each()
end

end
