class TourCost < ApplicationRecord
  belongs_to :quote
  belongs_to :tour
end
