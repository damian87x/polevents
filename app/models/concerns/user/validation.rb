module User::Validation
  extend ActiveSupport::Concern

  included do
    validate :id_not_changed

    def id_not_changed
      if self.id_changed? and self.persisted?
        self.errors.add(:id, "id can't be updated")
      end
    end
  end




end