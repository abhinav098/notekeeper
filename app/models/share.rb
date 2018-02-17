class Share < ActiveRecord::Base
  belongs_to :shareable, polymorphic: true
  has_many :shares, as: :shareable
  belongs_to :user

  enum permission: [ :reader, :updater, :owner ]
end
