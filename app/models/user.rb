class User < ApplicationRecord
 enum :role, { suport: 0, supervisor: 1, admin: 2 }

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :timeoutable, :trackable
end
