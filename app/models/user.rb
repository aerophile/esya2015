# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  role       :integer
#  provider   :string
#  uid        :string
#

class User < ActiveRecord::Base
  has_paper_trail

  has_many :event_admins
  has_many :events, through: :event_admins

  extend Enumerize
  enumerize :role, in: {:user => 0, :pr => 1,:event_head => 2, :admin => 3, :super_admin => 4}, default: :user

  # validates :name, presence: true
  validates :email, presence: true

  def to_s
    self.name
  end

  def self.from_omniauth(auth)
    if auth.info.email.split("@").last == "iiitd.ac.in"
      where("provider = ? AND uid = ? OR email = ?", auth.provider, auth.uid, auth.info.email).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name   # assuming the user model has a name
        user.uid = auth.uid
        user.provider = auth.provider
      end
    else
      Rails.logger.warn "Non IIITD access from "+ auth.info.email.to_s
      nil
    end
  end

  rails_admin do
    show do
      field :name
      field :email
      field :role
      field :events
    end
    list do
      field :name
      field :email
      field :role
    end
    edit do
      field :name
      field :email
      field :role
      field :events
    end
  end
end
