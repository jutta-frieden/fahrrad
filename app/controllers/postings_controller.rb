class PostingsController < ApplicationController

def new
    @posting = Posting.new
end

def create
    # This first line is to map the attributes of a posting to the respective database columns
    @posting = Posting.new(posting_params)
    # This is to save the model in the database. This returns a boolean, whether or not the model could be saved
    if @posting.save
        # This redirects to the show action for the model
        redirect_to @posting
    else
        render 'new'
    end
    
end

def show
    @posting = Posting.find(params[:id])
end

def index
    @postings = Posting.all
end

# This is Rails' security feature called strong_parameters. It requires us to tell Rails EXACTLY which attributes/parameters should be accepted in our controllers
# The fact that this function is private is a precaution for a hacker not to see the model's attributes
# WATCH OUT: Everything below this 'private' will be in fact private, so don't put the wrong stuff below this

private
  def posting_params
    params.require(:posting).permit(:title, :postcode)
  end


end

