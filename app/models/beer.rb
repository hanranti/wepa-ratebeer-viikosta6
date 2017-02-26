class Beer < ActiveRecord::Base
  include RatingAverage
  
  belongs_to :brewery
  belongs_to :style
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true
  validates :style, presence: true

  def to_s
    "#{name} #{brewery.name}"
  end

  def average
    return 0 if ratings.count == 0
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating||0) }
    # palauta listalta parhaat n kappaletta
    # miten? ks. http://www.ruby-doc.org/core-2.1.0/Array.html
    sorted_by_rating_in_desc_order.take(3)
  end
end