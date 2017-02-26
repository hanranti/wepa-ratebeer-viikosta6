class Style < ActiveRecord::Base
  include RatingAverage
  
  has_many :beers
  has_many :ratings, through: :beers

  def to_s
    name
  end

  def average
    return 0 if ratings.count == 0
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = Style.all.sort_by{ |b| -(b.average_rating||0) }
    # palauta listalta parhaat n kappaletta
    # miten? ks. http://www.ruby-doc.org/core-2.1.0/Array.html
    sorted_by_rating_in_desc_order.take(3)
  end
end