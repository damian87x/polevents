ActiveModel::Serializer.class_eval  do
  def self.to_child_class
    self.to_s.scan(/(^.*?)Serializer/)[0][0].constantize
  end
end

module BelongsToSerializer
  extend ActiveSupport::Concern

  included do
    self.to_child_class.belongs_to_list.each do |m|
      define_method(m) do
        object.send(m)
      end
    end
  end


end