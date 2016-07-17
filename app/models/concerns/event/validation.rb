module Event::Validation
  extend ActiveSupport::Concern

  included do
    validates :start_time, :name, presence: true
  end


end