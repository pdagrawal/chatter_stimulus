class Post < ApplicationRecord
  validate :body, length: { minimum: 1, maximum: 280 }
end
