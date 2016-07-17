class Filter < ApplicationRecord


  belongs_to :user, foreign_key: :user_id
  belongs_to :owner, polymorphic: true


end
