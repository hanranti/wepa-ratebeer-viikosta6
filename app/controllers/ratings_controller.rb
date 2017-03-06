class RatingsController < ApplicationController
  before_action :skip_if_cached, only:[:index]

  def index
    #Kun sivulle tullaan, ratinglist asetetaan cacheen.
    #RatingJob.perform poistaa tämän cachesta 10 min
    #päästä
    RatingJob.perform_async
    @breweries = Brewery.top(3)
    @beers = Beer.top(3)
    @users = User.top(3)
    @ratings = Rating.recent 
    @styles = Style.top(3)
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    if current_user.nil?
      redirect_to signin_path, notice:'you should be signed in'
    elsif @rating.save
      current_user.ratings << @rating  ## virheen aiheuttanut rivi
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end
  
  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end  

  private

    def skip_if_cached
      return render :index if request.format.html? and fragment_exist?( "ratinglist"  )
    end

end