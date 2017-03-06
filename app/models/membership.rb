class Membership < ActiveRecord::Base
  belongs_to :beer_club
  belongs_to :user

  scope :confirmed, -> { where confirmed:true }
  scope :unconfirmed, -> { where confirmed:[false, nil] }
end
