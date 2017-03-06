class RatingJob
  include SuckerPunch::Job

  def perform
    sleep 10*60
    expire_fragment('ratinglist')
  end
end