class ToDo < ActiveRecord::Base
  validates :description, presence: true
end
