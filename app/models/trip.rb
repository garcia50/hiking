class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_hiking_distance
    trails.sum(:length)
  end

  def avg_hiking_distance
    trails.average(:length).floor
  end

  def longest_hiking_distance
    trails.maximum(:length)
  end

  def shortest_hiking_distance
    trails.minimum(:length)
  end
end