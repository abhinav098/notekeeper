class Share < ActiveRecord::Base
  belongs_to :user
  belongs_to :note
  belongs_to :shareable, polymorphic: true
  belongs_to :sharer, class_name: 'User'
  has_many :shares, as: :shareable, dependent: :destroy
  PERMISSIONS = %w[reader updater owner].freeze
  enum permissions: PERMISSIONS
end
