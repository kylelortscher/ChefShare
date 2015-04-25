class Recipe < ActiveRecord::Base
	self.per_page = 4
	belongs_to :chef
	has_many :likes
	mount_uploader :picture, PictureUploader
	belongs_to :chef
	validates :chef_id, presence: true
	validates :name, presence: true, length: { in: 5..100 }
	validates :summary, presence: true, length: { in: 10..150 }
	validates :description, presence: true, length: { in: 20..500 }
	validate :picture_size
	default_scope -> { order(updated_at: :desc) }


	def thumbs_up_total
		self.likes.where(like: true).size
	end

	def thumbs_down_total
		self.likes.where(like: false).size
	end

	private
		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "Should be less than 5mb")
			end
		end		
	end	