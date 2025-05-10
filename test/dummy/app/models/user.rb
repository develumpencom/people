class User < ApplicationRecord
  has_many :people, class_name: "People::Person", foreign_key: "user_id"
end
