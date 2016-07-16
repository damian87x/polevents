class User < ApplicationRecord

  validate :id_not_changed

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def id_not_changed
    if self.id_changed? and self.persisted?
      self.errors.add(:id, "id can't be updated")
    end
  end


end
