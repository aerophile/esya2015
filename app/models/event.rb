class Event < ActiveRecord::Base
  has_many :event_admins
  has_many :registrations
end
