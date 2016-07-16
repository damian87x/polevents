class Event < ApplicationRecord

  belongs_to :user
  belongs_to :city
  belongs_to :topic


end
