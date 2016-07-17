module Event::DefMethods
  extend ActiveSupport::Concern

  included do
    def start_date
      start_time.strftime('%d/%m/%Y')
    end
  end

  class_methods do

    def belongs_to_list
      Event.reflect_on_all_associations(:belongs_to).map(&:class_name).compact
    end

    def serialize_methods
      %i{id start_time end_time}
    end

  end


end