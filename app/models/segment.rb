class Segment < ApplicationRecord
  validates_presence_of :name, :body

  def coords
    return [self.latitude.to_f, self.longitude.to_f]
  end

  def in_range?(user_position, meters)
   distance = Geocoder::Calculations.distance_between(self.coords, user_position, {units: :km})*1000
   return true if distance <= meters
   return false
  end

end
