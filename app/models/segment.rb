class Segment < ApplicationRecord
  validates_presence_of :name, :body
end
