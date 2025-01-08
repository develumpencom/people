module People
  class Person < ApplicationRecord
    belongs_to :user
  end
end
