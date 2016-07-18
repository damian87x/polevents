class Filter < ApplicationRecord
  extend SerializeMethods
  belongs_to :user, foreign_key: :user_id
  belongs_to :owner, polymorphic: true

  def self.serialize_methods
   %i{name} + Filter.belongs_to_list.map(&:to_sym)
  end

  delegate :name, to: :owner,  :allow_nil => true


end
