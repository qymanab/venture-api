class Segment < ApplicationRecord
  validates_presence_of :name, :body
  has_many :genres_segments
  has_many :genres, through: :genres_segments

  def coords
    return [self.latitude.to_f, self.longitude.to_f]
  end

  def in_range?(user_position, meters)
   # user = self.user_coords(user_position)

   distance = Geocoder::Calculations.distance_between(self.coords, user_position, {units: :km})*1000
   return true if distance <= meters
   return false
  end

  def self.display_nearby(user_position)
    # user = self.user_coords(user_position)
    segments = Segment.all
   return segments.select {|segment| segment.in_range?(user_position, 15)}
  end

  def check_range(user_position)
    # user = self.user_coords(user_position)

    if self.in_range?(user_position, 15)
      return self
    else
      return Segment.new(name: self.name, body: "You are not in range to access this content.", latitude: self.latitude , longitude: self.longitude )
    end
  end

  # def user_coords(user_position_array)
  #   user_position_array.map {|element| element.to_f}
  # end

end
