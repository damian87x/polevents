class User < ApplicationRecord


  include *[User::Relations,
            User::Validation
  ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
