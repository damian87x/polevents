module Event::Validation
  extend ActiveSupport::Concern

  included do
    validates :start_time, :name, :end_time, presence: true
  end


end