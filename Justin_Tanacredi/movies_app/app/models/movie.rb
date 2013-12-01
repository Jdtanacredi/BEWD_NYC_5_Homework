class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {message: "This movie already exists"}#true#, message: "This movie already exists"
  validates :description, presence: true, length: {minimum: 10, too_short: "Your description is too short"}
  validates :year_released, numericality: {only_integer: true, greater_than: 1880}
  #validates :rating, length: {in: 1..5}

  def self.search_for(query)
    where('title LIKE :query OR description LIKE :query', query:  "#{query}%")
  end
end
