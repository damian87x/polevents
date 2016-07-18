module SerializeMethods

  def belongs_to_list
    self.reflect_on_all_associations(:belongs_to).map(&:class_name).compact.map(&:downcase)
  end

end