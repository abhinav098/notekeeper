class Note < ActiveRecord::Base
  belongs_to :user
  has_many :tags, through: :taggings
  has_many :taggings, dependent: :destroy
  has_many :shares, as: :shareable, dependent: :destroy

  validates :title, presence:true
  validates :body, presence:true

  def all_tags=(names)
  	self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
	  end
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end
end
