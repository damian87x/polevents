class User < ApplicationRecord


  include *[User::Relations,
            User::Validation
  ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def update_filters(p)
    self.filters.each do |f|
      h= case f.owner_type
        when 'City'
          {owner_id: p[:city_id]}
        when 'Topic'
          {owner_id: p[:topic_id]}
        when 'DateAndRange'
          nil
      end
      f.update_attributes(h) if h
    end
  end

end
