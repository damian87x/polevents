module Event::DefMethods
  extend ActiveSupport::Concern

  included do
    def start_date
      return nil if start_time.blank?
      start_time.strftime('%d/%m/%Y')
    end
  end

  class_methods do

    def serialize_methods
      %i{id start_time end_time start_date name} + Event.belongs_to_list.map(&:to_sym)
    end


  end


end